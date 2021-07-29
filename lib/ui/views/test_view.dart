import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPageState();
}

class _TestPageState extends State<TestView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Test screen'),
                onPressed: () {
                  // Navigate to the second screen when tapped.
                  Navigator.pop(context);
                },
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              Text(
                'You have pushed the button this many times:',
                 style: TextStyle(fontFamily: 'Dancing Script'),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          )

      ),
    );
  }

}