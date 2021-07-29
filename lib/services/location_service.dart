

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/api/location_api.dart';
import 'package:flutter_template/api/post_api.dart';
import 'package:flutter_template/models/locations.dart';
import 'package:flutter_template/models/post.dart';
import 'package:flutter_template/util/dbhelper.dart';

import '../locator.dart';

class LocationService {
  LocationApi _api = locator<LocationApi>();

  Future<Locations> getLocations() async {
    var locations = await _api.getLocations();
//    print('response Location model-----' + response.statusCode.toString() +  response.data);
    return locations;
  }
}


