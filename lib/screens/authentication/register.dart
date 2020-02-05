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
  String error = "";

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
              SizedBox(height: 12.0),
              TextFormField(
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
                        _authService.registerWithEmailAndPwd(email, password);
                    if (result == null) {
                      setState(() =>
                          error = "Please supply valid email and password");
                    }
                  }
                },
                color: Colors.orangeAccent,
                child: Text(
                  'Register',
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
