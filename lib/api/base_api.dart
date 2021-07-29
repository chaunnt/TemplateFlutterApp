import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/models/response.dart';
import 'package:flutter_template/models/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class BaseApi {

  var client = new http.Client();
   Map<String, String> defaultHeaders = {"Content-type": "application/json"};
  final token = 'WIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikpv';
  Map<String, String> authorizationHeaders = {
    HttpHeaders.contentTypeHeader: "application/json", // or whatever
    HttpHeaders.authorizationHeader: "Bearer WIiOiIxMjM0NTY3ODkwIiwibmFtZSI6Ikpv",//example
  };

  Future<ResponseModel> get(url, {Map<String, String> headers}) async{
    var response = await client.get(url,headers: headers != null ? headers : defaultHeaders);
    if (response.statusCode < 200 || response.statusCode > 400 ) {
      throw new Exception("Error while fetching data");
    }
    return ResponseModel.createResponseData(response);

  }

  Future<ResponseModel> post(url, {Map<String, String> headers,Map body}) async{
    var response = await client.post(url,headers: headers != null ? headers : defaultHeaders,body:body);
    if (response.statusCode < 200 || response.statusCode > 400 ) {
      throw new Exception("Error while fetching data");
    }
    return ResponseModel.createResponseData(response);

  }

}