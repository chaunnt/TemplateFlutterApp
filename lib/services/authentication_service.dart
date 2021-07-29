import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../locator.dart';
import '../api/user_api.dart';

class AuthenticationService {
  UserApi _api = locator<UserApi>();

//  StreamController<User> userController = StreamController<User>();

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userString = prefs.getString('user');

    if(userString != null) {
      Map<String, dynamic> userMap = jsonDecode(userString);
      debugPrint('getUser: '+  userString);

       return User.fromJson(userMap);

    }
    return User.initial();
  }

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;


    if(hasUser) {
//      userController = StreamController<User>();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String json = jsonEncode(fetchedUser);
      debugPrint('setItemuser: '+  json);
      prefs.setString('user', json);
//       userController.add(fetchedUser);

    }

    return hasUser;
  }
}