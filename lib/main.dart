import 'package:brew_me_coffee/models/user.dart';
import 'package:brew_me_coffee/screens/wrapper.dart';
import 'package:brew_me_coffee/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().appUser,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
