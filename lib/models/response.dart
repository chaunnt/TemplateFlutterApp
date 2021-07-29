import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ResponseModel {
  int statusCode;
  String data;
  String message;
  ResponseModel({this.statusCode, this.data, this.message});

  ResponseModel.createResponseData(Response response) {
    statusCode = response.statusCode;
    data = response.body;
    message = '';
  }


}
