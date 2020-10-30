import 'package:flutter/material.dart';
import 'package:flutter_common/components/logo/logo.dart';
import 'package:flutter_common/components/shadow_button/shadow_button.dart';
import 'package:flutter_common/constants/my_colors.dart';

class SignIn extends StatelessWidget {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: MyColors.black_99)
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(size: 140.0),
            _username(),
            _password(),
            // _signinButton(),
            _mySigninButton()
          ],
        ),
      )
    );
  }

  Widget _username() {
    return Container(
      padding: EdgeInsets.only(top: 20.0, right: 42.0, left: 42.0),
      child: TextField(
        controller: _userNameController,
        autofocus: false,
        decoration: InputDecoration(
          labelText: 'Username or Email',
          hintText: 'Input username'
        )
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, right: 42.0, bottom: 20.0, left: 42.0),
      child: TextField(
        controller: _passwordController,
        autofocus: false,
        decoration: InputDecoration(
          labelText: 'password',
          hintText: 'password'
        ),
        obscureText: true
      ),
    );
  }

  Widget _signinButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 131, vertical: 12.0),
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0
          )
        ),
        onPressed: () {
          print({
            'username': _userNameController.text,
            'passowrd': _passwordController.text,
          });
        },
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0)
        ),
      ),
    );
  }

  Widget _mySigninButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: ShadowButton(
        text: 'SIGN IN',
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600
        ),
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 12.0),
        borderRadius: BorderRadius.circular(60.0),
        onPressed: () {
          print('Sign In');
        },
      )
    );
  }

}