import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloflutter/views/Home_view.dart';
import 'package:helloflutter/views/Contact_view.dart';
import 'package:helloflutter/views/Base_view.dart';
import 'package:helloflutter/views/Splash_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => SplashView());
      case '/':
        return MaterialPageRoute(builder: (_) => BaseView());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'contact':
        return MaterialPageRoute(builder: (_) => ContactView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
