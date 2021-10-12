//@dart=2.9
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_wars/models/user_model_failure.dart';
import 'package:brain_wars/services/firebase_auth_service.dart';
import 'package:brain_wars/services/firestore_service.dart';
import 'package:brain_wars/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc() : super(FirebaseInitial());

  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Stream<FirebaseState> mapEventToState(
    FirebaseEvent event,
  ) async* {
    //sign in event
    if (event is SignIn) {
      yield FirebaseSigningIn();
      final failureOrid = await _authService.signIn(
          email: event.email, password: event.password);

      failureOrid.fold((l) => add(FirebaseError(l)),
          (r) => add(GetOrCreateUserData(r, 'GET', '', event.context)));
    }

    //sign up event
    if (event is SignUp) {
      yield FirebaseSigningUp();
      final isUsernameAvailable =
          await _firestoreService.checkUsername(event.username);
      if (!isUsernameAvailable) {
        final failureOrid = await _authService.signUp(
            email: event.email,
            password: event.password,
            username: event.username);

        failureOrid.fold(
            (l) => add(FirebaseError(l)),
            (r) => add(GetOrCreateUserData(
                r, 'CREATE', event.username, event.context)));
      } else {
        yield FirebaseFailure('USERNAME_NOT_AVAILABLE');
      }
    }

    //auth state event
    if (event is AuthStates) {}

    //email verify event
    if (event is EmailVerification) {
      yield FirebaseVerifyingEmail();
      await _authService.verifyEmail();
      await _authService.signout();
      yield FirebaseVerificationEmailLinkSent();
    }

    //get or create user data
    if (event is GetOrCreateUserData) {
      yield FetchingData();
      if (event.getOrCreate == "CREATE") {
        await _firestoreService.createUserData(
            id: event.id, username: event.username);
        add(EmailVerification());
      } else {
        final res = await _firestoreService.getUserData(id: event.id);
        res['id'] = event.id;
        add(SignedIn());
      }
    }

    //signed in successfuly
    if (event is SignedIn) {
      yield FirebaseSignedIn();
    }

    //handle error
    if (event is FirebaseError) {
      yield FirebaseFailure(event.failure.error);
    }

    //sign in again after email verified
    if (event is SignInAgain) {
      print(1);
      yield FirebaseInitial();
      Utility().toggleSigninform(event.context);
    }

    if (event is SignInWithGoogle) {
      yield FirebaseSigningIn();
      final failureOrid = await _authService.signInWithGoogle();

      failureOrid.fold((l) => add(FirebaseError(l)), (r) => add(SignedIn()));
    }
  }
}
