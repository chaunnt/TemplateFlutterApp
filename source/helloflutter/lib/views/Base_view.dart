import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/router/router.dart';

class BaseView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _currentIndex = 0;
  final _homeScreen = GlobalKey<NavigatorState>();
  final _contactScreen = GlobalKey<NavigatorState>();

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
            key: _contactScreen,
            onGenerateRoute: Router.generateRoute,
            initialRoute: 'contact',
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
            icon: IconButton(
              icon: new Image.asset('assets/images/Home_100x100.png'),
              tooltip: 'Home',
              onPressed: () {},
            ),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: new Image.asset('assets/images/Phone_100x100.png'),
              tooltip: 'Contact',
              onPressed: () {},
            ),
            title: Text("Contact"),
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
          _contactScreen.currentState.popUntil((route) => route.isFirst);
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
