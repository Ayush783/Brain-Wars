//@dart=2.9
import 'package:brain_wars/models/user_model_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  final _auth = FirebaseAuth.instance;

  //sign up
  Future<Either<UserModelFailure, String>> signUp(
      {@required String email,
      @required String password,
      @required String username}) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(userCred.user.uid);
    } catch (e) {
      return left(UserModelFailure(e.toString()));
    }
  }

  //sign in
  Future<Either<UserModelFailure, String>> signIn(
      {@required String email, @required String password}) async {
    try {
      final userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(userCred.user.uid);
    } catch (e) {
      return left(UserModelFailure(e.toString()));
    }
  }

  // auth state changes
  Stream<User> authStateChanges() async* {
    yield* _auth.authStateChanges();
  }

  //vsend link to verify email
  Future<bool> verifyEmail() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) await user.sendEmailVerification();
    if (user.emailVerified)
      return true;
    else
      return false;
  }
}
