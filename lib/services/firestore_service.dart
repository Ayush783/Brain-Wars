import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {
  final _store = FirebaseFirestore.instance;

  //check is username is already registered
  Future<bool> checkUsername(String value) async {
    final result = await _store.collection('usernames').doc('USERNAMES').get();
    final List data = result.data()!['usernames'];
    print(data.contains(value));
    return data.contains(value);
  }

  //create user data
  Future<void> createUserData(
      {@required String? id, @required String? username}) async {
    await _store.collection('usernames').doc('USERNAMES').update({
      'usernames': FieldValue.arrayUnion([username]),
    });
    await _store.collection('users').doc(id).set({'username': username});
  }
}
