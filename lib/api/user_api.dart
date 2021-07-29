import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/api/urls.dart';
import 'package:flutter_template/models/user.dart';

import 'base_api.dart';

/// The service responsible for networking requests
class UserApi extends BaseApi {


  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await get('$base_url$user_path$userId');
//    print('response-----' + response.statusCode.toString() +  response.data);
    // Convert and return
    return User.fromJson(json.decode(response.data));
  }



}
