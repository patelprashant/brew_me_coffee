import 'package:brew_me_coffee/services/auth.dart';
import 'package:brew_me_coffee/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleSignIn;

  const SignIn({this.toggleSignIn});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleSignIn();
            },
            icon: Icon(Icons.person),
            label: Text('Register'),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 48.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 24.0),
              TextFormField(
                decoration: txtInputDecoration,
                validator: (val) => val.isEmpty ? "Enter valid email" : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 12.0),
              TextFormField(
                decoration: txtInputDecoration.copyWith(hintText: "Password"),
                validator: (val) =>
                    val.length < 6 ? "Enter the password 6+ chars long" : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                obscureText: true,
              ),
              SizedBox(height: 12.0),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _authService.emailSignIn(email, password);
                    if (result == null) {
                      setState(() =>
                          error = "Couldn\'t Sign in with those credentials");
                    }
                  }
                },
                color: Colors.orangeAccent,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 16.0),
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
