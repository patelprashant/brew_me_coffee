import 'package:brew_me_coffee/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  //text field state
  String email = "";
  String password = "";

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
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 24.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => password = val);
                },
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              RaisedButton(
                onPressed: () async {
                  print(email);
                  print(password);

//                  dynamic result = await _authService.signInAnon();
//                  if (result == null) {
//                    print('Error signing in anon');
//                  } else {
//                    print('Signing in anon');
//                    print(result.uid);
//                  }
                },
                color: Colors.orangeAccent,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//RaisedButton(
//child: Text('Sign in Anon'),
//onPressed: () async {
//dynamic result = await _authService.signInAnon();
//if (result == null) {
//print('Error signing in anon');
//} else {
//print('Signing in anon');
//print(result.uid);
//}
//},
//)
