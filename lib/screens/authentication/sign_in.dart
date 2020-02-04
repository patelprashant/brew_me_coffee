import 'package:brew_me_coffee/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 48.0),
        child: RaisedButton(
          child: Text('Sign in Anon'),
          onPressed: () async {
            dynamic result = await _authService.signInAnon();
            if (result == null) {
              print('Error signing in anon');
            } else {
              print('Signing in anon');
              print(result);
            }
          },
        ),
      ),
    );
  }
}
