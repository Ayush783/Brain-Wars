//@dart=2.9
import 'package:brain_wars/models/user_model.dart';
import 'package:brain_wars/models/user_model_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  //sign up
  Future<Either<UserModelFailure, Usermodel>> signUp(
      {@required String email,
      @required String password,
      @required String username}) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(Usermodel(username: username, id: userCred.user.uid));
    } catch (e) {
      return left(UserModelFailure(e.toString()));
    }
  }

  //sign in
  Future<String> signIn(
      {@required String email, @required String password}) async {
    final userCred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCred.user.uid;
  }

  // auth state changes
  Stream<User> authStateChanges() async* {
    yield* _auth.authStateChanges();
  }

  //vsend link to verify email
  verifyEmail() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) await user.sendEmailVerification();
  }
}
