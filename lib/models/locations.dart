
import 'package:flutter_template/models/region.dart';
import 'dart:convert';
import 'office.dart';

class Locations {
  Locations({
    this.offices,
    this.regions,
  });

  List<Office> offices;
  List<Region> regions;

  Locations.fromJson(Map<String, dynamic> jsonString) {
//    print('Locations-----' + jsonString);
//    var parsedOffice = json.decode(jsonString['offices']) as List<dynamic>;
    offices = List<Office>();
    for (var office in jsonString['offices']) {
      offices.add(Office.fromJson(office));
    }
//    var parsedRegions = json.decode(jsonString['regions']) as List<dynamic>;
    regions = List<Region>();
    for (var region in jsonString['regions']) {
      regions.add(Region.fromJson(region));
    }
//    offices = json['offices'];
//    regions = json['regions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offices'] = this.offices;
    data['regions'] = this.regions;
    return data;
  }
}
