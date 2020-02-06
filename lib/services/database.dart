import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // Collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  final String uid;

  DatabaseService({this.uid});

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
