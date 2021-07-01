//@dart=2.9
part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseState {}

class FirebaseInitial extends FirebaseState {}

class FirebaseSigningUp extends FirebaseState {}

class FirebaseSigningIn extends FirebaseState {}

class FirebaseSignedUp extends FirebaseState {}

class FirebaseSignedIn extends FirebaseState {}

class FirebaseFailure extends FirebaseState {}

class FirebaseVerifyingEmail extends FirebaseState {}
