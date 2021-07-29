import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/services/authentication_service.dart';
import 'package:flutter_template/ui/shared/app_colors.dart';
import 'package:flutter_template/ui/view_models/home_model.dart';
import 'package:flutter_template/ui/view_models/setting_model.dart';
import 'package:flutter_template/ui/views/base_view.dart';
import 'package:provider/provider.dart';

import '../../application.dart';
import '../../locator.dart';

class SettingView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingView> {

  final Map<dynamic, dynamic> languagesMap = {
    application.supportedLanguages[0]: application.supportedLanguagesCodes[0],
    application.supportedLanguages[1]: application.supportedLanguagesCodes[1],
  };


  @override
  Widget build(BuildContext context) {
    return BaseView<SettingModel>(
      onModelReady: (model) => {},
      builder: (context,model,child)=> Scaffold(
        body: _buildLanguagesList(),
        backgroundColor: backgroundColor,
      ),
    );
  }

_buildLanguagesList() {
  return ListView.builder(
    itemCount: application.supportedLanguages.length,
    itemBuilder: (context, index) {
      return _buildLanguageItem(application.supportedLanguages[index]);
    },
  );
}

_buildLanguageItem(String language) {
  return InkWell(
    onTap: () {
      print(language);
      application.onLocaleChanged(Locale(languagesMap[language]));

//      locator<AuthenticationService>().userController.add( User.fromJson({"id":0,"name":"Long","username":"phi Long"}));
//      Provider.of<HomeModel>(context, listen: false).getPosts(0);
    },
    child: Center(
      child:
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0),
                  color: Color.fromARGB(80, 0, 0, 0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(  language,style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
            ),
         ],
        ),
      ),

    ),
  );
}

}