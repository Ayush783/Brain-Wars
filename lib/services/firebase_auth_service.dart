//@dart=2.9
import 'dart:async';

import 'package:brain_wars/models/user_model_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  static final _auth = FirebaseAuth.instance;

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
      final isVerified = this.checkEmailVerification(userCred.user);
      if (isVerified)
        return right(userCred.user.uid);
      else
        return left(UserModelFailure('Email not verified'));
    } catch (e) {
      return left(UserModelFailure(e.toString()));
    }
  }

  // auth state changes
  Stream<User> authStateChanges() async* {
    yield* _auth.authStateChanges();
  }

  //vsend link to verify email
  Future<void> verifyEmail() async {
    await _auth.currentUser.sendEmailVerification();
  }

  bool checkEmailVerification(User user) {
    final isVerified = user.emailVerified;
    return isVerified;
  }

  //sign out
  Future<void> signout() async {
    await _auth.signOut();
  }
}
