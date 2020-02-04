import 'package:brew_me_coffee/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleSignIn;

  const Register({this.toggleSignIn});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

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
        title: Text('Register with Brew'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleSignIn();
            },
            icon: Icon(Icons.person),
            label: Text('Sign In'),
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
                validator: (val) => val.isEmpty ? "Enter valid email" : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (val) =>
                val.length < 6 ? "Enter the password 6+ chars long" : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print(email);
                    print(password);
                  } else {
                    print("Form is not valid");
                  }

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
                  'Register',
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
