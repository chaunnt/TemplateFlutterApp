import 'package:flutter/material.dart';
import 'package:flutter_template/router/router.dart';

import '../../i18n/app_translations.dart';
import '../../application.dart';


class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  final _homeScreen = GlobalKey<NavigatorState>();
  final _aboutScreen = GlobalKey<NavigatorState>();
  final _settingScreen = GlobalKey<NavigatorState>();
  final _scanScreen = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _homeScreen,
            onGenerateRoute: Router.generateRoute,
            initialRoute: 'home',
          ),
          Navigator(
            key: _aboutScreen,
            onGenerateRoute: Router.generateRoute,
            initialRoute: 'about',
          ),
          Navigator(
            key: _settingScreen,
            onGenerateRoute: Router.generateRoute,
            initialRoute: 'setting',
          ),
          Navigator(
            key: _scanScreen,
            onGenerateRoute: Router.generateRoute,
            initialRoute: 'scan',
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (val) => _onTap(val, context),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text(AppTranslations.of(context).text("tab_home")),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text(AppTranslations.of(context).text("tab_about")),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(AppTranslations.of(context).text("tab_setting")),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scanner),
            title: Text(AppTranslations.of(context).text("tab_scan")),
          ),

        ],
      ),
    );
  }

  void _onTap(int val, BuildContext context) {
    if (_currentIndex == val) {
      switch (val) {
        case 0:
          _homeScreen.currentState.popUntil((route) => route.isFirst);

          break;
        case 1:
          _aboutScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 2:
          _settingScreen.currentState.popUntil((route) => route.isFirst);
          break;
          case 2:
          _scanScreen.currentState.popUntil((route) => route.isFirst);
          break;

        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }
}