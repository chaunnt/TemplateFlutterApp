import 'package:flutter/material.dart';
import 'package:pearl_app/router/router.dart';
import 'package:pearl_app/screen/home/home_page.dart';
import 'package:pearl_app/screen/navigator/navigator_page.dart';
import 'package:pearl_app/screen/product_detail/product_detail_page.dart';
import 'package:pearl_app/screen/splash/splash_screen_page.dart';

//void main() {
//  runApp( MaterialApp(
//    home:  SplashScreen(),
//    routes: <String, WidgetBuilder>{
//      '/HomeScreen': (BuildContext context) => HomeScreen()
//    },
//  ));
//}

void main() {
  runApp(
    MaterialApp(
      home: SplashScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Router.tab_page:
            return MaterialPageRoute(builder: (context)=> TabPage());
          case Router.product_detail_page:
            return MaterialPageRoute(builder: (context)=> ProductDetailScreen());
        }
      },
    )
  );
}
