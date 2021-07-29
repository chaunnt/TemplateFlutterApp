import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_template/locator.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _login(context),
      builder: (context, snapshot) {
        return Scaffold(
//          appBar: AppBar(
//            title: Text('Auto Login Home Page'),
//          ),
          body: Container(
            // Set the image as the background of the Container
            decoration: BoxDecoration(
                image: DecorationImage(
                  // Load image from assets
                    image: AssetImage('images/splash.png'),
                    // Make the image cover the whole area
                    fit: BoxFit.cover)),
          ));

      },
    );

  }

  Future<String> _login(BuildContext context) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userString = prefs.getString('user');
    if(userString != null){
      Map<String, dynamic> userMap = jsonDecode(userString);
      User user = User.fromJson(userMap);

      if (userMap != null && userMap['id'] != 0) {
//        locator<AuthenticationService>().userController.add(user);

        await Future.delayed(Duration(seconds: 1)).then((value) {
          Navigator.pushNamedAndRemoveUntil(context, '/',  (_) => false);
        });
      }  else{
        Navigator.pushNamedAndRemoveUntil(context, 'login',  (_) => false);
      }
    }
    else{
      Navigator.pushNamedAndRemoveUntil(context, 'login',  (_) => false);
    }

    return "Logined";
  }
}