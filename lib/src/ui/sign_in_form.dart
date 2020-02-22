import 'package:flutter/material.dart';
import 'package:flutter_firebase_with_bloc/src/blocs/login_bloc.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final LoginBloc _loginBloc = LoginBloc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        emailField(),
        Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
        passwordField(),
        Container(margin: EdgeInsets.only(top: 5.0, bottom: 5.0)),
        submitButton()
      ],
    );
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: _loginBloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: _loginBloc.changePassword.add,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Enter Your Password', errorText: snapshot.error),
          );
        });
  }

  Widget emailField() {
    return StreamBuilder(
        stream: _loginBloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: _loginBloc.changeEmail.add,
            decoration: InputDecoration(
                hintText: 'Enter Your Email', errorText: snapshot.error),
          );
        });
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: _loginBloc.isSignedIn,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button();
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget button() {
    return RaisedButton(
        child: Text('Submit'),
        textColor: Colors.white,
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {
//          if (_bloc.validateFields()) {
          authenticateUser();
//          } else {}
        });
  }

  void authenticateUser() {
    _loginBloc.submit().then((value) {
      if (value == 0) {
        //New User
        _loginBloc.registerUser().then((value) {});
      } else {
        //Already registered

      }
    });
  }
}
