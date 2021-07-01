import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:brain_wars/services/firebase_auth_service.dart';
import 'package:brain_wars/services/firestore_service.dart';
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
      final id = await _authService.signIn(
          email: event.email, password: event.password);
    }

    //sign up event
    if (event is SignUp) {}

    //auth state event
    if (event is AuthStates) {}

    //email verify event
    if (event is EmailVerification) {}
  }
}
