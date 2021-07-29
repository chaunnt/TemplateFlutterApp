import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_template/locator.dart';
import 'package:flutter_template/ui/view_models/home_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/services/authentication_service.dart';
import 'package:flutter_template/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'i18n/app_translations_delegate.dart';
import 'application.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  {
  AppTranslationsDelegate _newLocaleDelegate;
  User user = User.initial();
  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
    getUser();
  }
  getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userString = prefs.getString('user');

    if(userString != null) {
      Map<String, dynamic> userMap = jsonDecode(userString);
      debugPrint('getUser: '+  userString);
      setState(() {
        user = User.fromJson(userMap);
      });
    }
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {

    return  MultiProvider(
      providers: [
//        StreamProvider<User>(
//        initialData: user,
//        create: (context) {
//          return locator<AuthenticationService>().userController.stream;
//        },
//        ),
        FutureProvider(
            initialData: user,
            create: (_) => locator<AuthenticationService>().getUser()),
        ChangeNotifierProvider(
          create: (context) => HomeModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Template',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute:   'splash' ,
        onGenerateRoute:  Router.generateRoute,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('vi', 'VI'),
        ],
        // These delegates make sure that the localization data for the proper language is loaded
        localizationsDelegates: [
          // THIS CLASS WILL BE ADDED LATER
          // A class which loads the translations from JSON files
          _newLocaleDelegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
        ],
        // Returns a locale which will be used by the app
//        localeResolutionCallback: (locale, supportedLocales) {
//          // Check if the current device locale is supported
//          for (var supportedLocale in supportedLocales) {
//            if (supportedLocale.languageCode == locale.languageCode &&
//                supportedLocale.countryCode == locale.countryCode) {
//              return supportedLocale;
//            }
//          }
//          // If the locale of the device is not supported, use the first one
//          // from the list (English, in this case).
//          _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
//
//          return supportedLocales.first;
//        },
      ),
    );
  }

}

