import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/models/post.dart';
import 'package:flutter_template/ui/views/about_view.dart';
import 'package:flutter_template/ui/views/home_view.dart';
import 'package:flutter_template/ui/views/login_view.dart';
import 'package:flutter_template/ui/views/post_view.dart';
import 'package:flutter_template/ui/views/scan_view.dart';
import 'package:flutter_template/ui/views/setting_view.dart';
import 'package:flutter_template/ui/views/splash_screen_view.dart';
import 'package:flutter_template/ui/views/tab_screen_view.dart';
import 'package:flutter_template/ui/views/test_view.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => TabsScreen());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'about':
        return MaterialPageRoute(builder: (_) => AboutView());
      case 'setting':
        return MaterialPageRoute(builder: (_) => SettingView());
      case 'test':
        return MaterialPageRoute(builder: (_) => TestView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'scan':
        return MaterialPageRoute(builder: (_) => ScanView());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
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
