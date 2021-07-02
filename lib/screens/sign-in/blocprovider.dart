//@dart=2.9
import 'package:brain_wars/bloc/firebase_bloc/firebase_bloc.dart';
import 'package:brain_wars/screens/sign-in/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBlocProvider extends StatelessWidget {
  const SignInBlocProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FirebaseBloc>(
      create: (context) => FirebaseBloc(),
      child: SigninScreen(),
    );
  }
}
