import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ProfileScreen extends StatefulWidget {
  final BehaviorSubject<int> streamCurrentTab;

  ProfileScreen({this.streamCurrentTab});


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}