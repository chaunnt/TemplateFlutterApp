


import 'package:flutter_template/services/authentication_service.dart';
import 'package:flutter_template/ui/shared/viewstate.dart';

import '../../locator.dart';
import 'base_model.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    // Not a number
    if(userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }
    var success = await _authenticationService.login(userId);

    if(success){
      errorMessage = "";
    }
    // Handle potential error here too. 
//    await Future.delayed(Duration(seconds: 3));

    setState(ViewState.Idle);
    return success;
  }
}
