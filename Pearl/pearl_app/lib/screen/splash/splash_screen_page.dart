import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pearl_app/resource/values.dart';
import 'package:pearl_app/router/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(ResourceImages.SplashScreen),
            fit: BoxFit.cover
        ) ,
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    startTime();
  }


  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(Router.tab_page);
  }
}

