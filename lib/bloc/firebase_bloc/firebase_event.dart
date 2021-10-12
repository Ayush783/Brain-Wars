//@dart=2.9
part of 'firebase_bloc.dart';

@immutable
abstract class FirebaseEvent {}

class SignUp extends FirebaseEvent {
  final String email, password, username;
  final BuildContext context;

  SignUp(
      {@required this.email,
      @required this.password,
      @required this.username,
      this.context});
}

class SignIn extends FirebaseEvent {
  final String email, password;
  final BuildContext context;

  SignIn({@required this.email, @required this.password, this.context});
}

class AuthStates extends FirebaseEvent {}

class EmailVerification extends FirebaseEvent {}

class SignedIn extends FirebaseEvent {}

class SignInAgain extends FirebaseEvent {
  final BuildContext context;

  SignInAgain(this.context);
}

class GetOrCreateUserData extends FirebaseEvent {
  final String id, getOrCreate, username;
  final BuildContext context;

  GetOrCreateUserData(this.id, this.getOrCreate, this.username, this.context);
}

class FirebaseError extends FirebaseEvent {
  final UserModelFailure failure;

  FirebaseError(this.failure);
}

class SignInWithGoogle extends FirebaseEvent {}
