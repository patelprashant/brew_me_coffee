import 'package:brew_me_coffee/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _userFromFBUser(FirebaseUser fbUser) {
    return fbUser != null ? User(uid: fbUser.uid) : null;
  }

  //auth change user stream and map it to app user
  Stream<User> get appUser {
    return _auth.onAuthStateChanged.map(_userFromFBUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser fbUser = result.user;
      return _userFromFBUser(fbUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//TODO: sign in with email and pwd
//TODO: register with email and pwd
//TODO: sign out
}
