import 'package:brew_me_coffee/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/authentication.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<User>(context);
    if (appUser == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
