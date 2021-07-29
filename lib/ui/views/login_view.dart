
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/ui/common_widgets/login_header.dart';
import 'package:flutter_template/ui/shared/app_colors.dart';
import 'package:flutter_template/ui/shared/viewstate.dart';
import 'package:flutter_template/ui/view_models/login_model.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => _LoginViewState();

}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
                validationMessage: model.errorMessage,
                controller: _controller),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                var loginSuccess = await model.login(_controller.text);
                if(loginSuccess){
//                  debugPrint('Login user: '+  Provider.of<User>(context,listen: false).id.toString());
                  Provider.of<User>(context,listen: false);
                  Navigator.pushNamed(context, '/');
                }
              },
            )
          ],),
      ),
    );
  }
}