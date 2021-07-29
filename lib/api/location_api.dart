import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/models/locations.dart';
import 'package:flutter_template/models/post.dart';
import 'package:flutter_template/models/user.dart';

import 'urls.dart';
import 'base_api.dart';

/// The service responsible for networking requests
class LocationApi extends BaseApi {




  Future<Locations> getLocations() async {
    // Get user profile for id
    var response = await get('https://about.google/static/data/locations.json');
    print('responsegetLocations-----' + response.statusCode.toString() +  response.data);

    // Convert and return
    return Locations.fromJson(json.decode(response.data));
  }



}
