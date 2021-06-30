import 'package:brain_wars/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  //sign up
  Future<Usermodel> signUp(
      {@required String? email,
      @required String? password,
      @required String? username}) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      return Usermodel(username: username, id: userCred.user!.uid);
    } catch (e) {
      return Usermodel.failure(e.toString());
    }
  }

  //sign in
  Future<String> signIn(
      {@required String? email, @required String? password}) async {
    final userCred = await _auth.signInWithEmailAndPassword(
        email: email!, password: password!);
    return userCred.user!.uid;
  }

  // auth state changes
  Stream<User?> authStateChanges() async* {
    yield* _auth.authStateChanges();
  }

  //vsend link to verify email
  verifyEmail() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) await user.sendEmailVerification();
  }
}
