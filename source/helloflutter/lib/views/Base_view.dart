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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Show menu',
          onPressed: () {},
          color: Colors.amber,
        ),
        title: Text("Gao Viet"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Notification',
            onPressed: () {},
            color: Colors.amber,
          ),
        ],
      ),
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
    );
  }
}
