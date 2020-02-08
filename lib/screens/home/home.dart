import 'package:brew_me_coffee/models/brew.dart';
import 'package:brew_me_coffee/screens/home/brew_list.dart';
import 'package:brew_me_coffee/services/auth.dart';
import 'package:brew_me_coffee/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew my Coffee'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
