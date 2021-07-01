//@dart=2.9
part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseEvent {}

class SignUp extends FirebaseEvent {
  final String email, password, username;

  SignUp(
      {@required this.email, @required this.password, @required this.username});
}

class SignIn extends FirebaseEvent {
  final String email, password;

  SignIn({@required this.email, @required this.password});
}

class AuthStates extends FirebaseEvent {}

class EmailVerification extends FirebaseEvent {}

class SignedIn extends FirebaseEvent {}

class GetOrCreateUserData extends FirebaseEvent {
  final String id, getOrCreate, username;

  GetOrCreateUserData(this.id, this.getOrCreate, this.username);
}

class FirebaseError extends FirebaseEvent {
  final UserModelFailure failure;

  FirebaseError(this.failure);
}
