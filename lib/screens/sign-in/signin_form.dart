//@dart=2.9
import 'package:brain_wars/bloc/firebase_bloc/firebase_bloc.dart';
import 'package:brain_wars/constants/colors.dart';
import 'package:brain_wars/constants/textstyles.dart';
import 'package:brain_wars/providers/toggle_form_provider.dart';
import 'package:brain_wars/screens/sign-in/widgets/signup_form.dart';
import 'package:brain_wars/screens/sign-in/widgets/sign_in_form_body.dart';
import 'package:brain_wars/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show Consumer;
import 'package:sizer/sizer.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    Key key,
  }) : super(key: key);

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final PageController pageController = PageController(initialPage: 0);
  FirestoreService service = FirestoreService();
  Widget form;

  @override
  void initState() {
    super.initState();
    form = Signinformbody();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseBloc, FirebaseState>(
      builder: (context, state) {
        if (state is FirebaseSigningIn)
          return SignInLoader(
            value: 'Signing you in...',
          );
        else if (state is FirebaseSigningUp)
          return SignInLoader(
            value: 'Signing you up...',
          );
        else if (state is FetchingData)
          return SignInLoader(
            value: 'Fetching data...',
          );
        else if (state is FirebaseVerifyingEmail)
          return SignInLoader(
            value: 'Verifying email...',
          );
        else if (state is FirebaseVerificationEmailLinkSent)
          return Container(
            height: 72.h,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'A verification link must have arrived in your inbox, Kindly click on it to verify your email and then sign in again',
                    style: kbody1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<FirebaseBloc>().add(SignInAgain(context));
                    },
                    child: Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff1a191c),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          );
        else
          return Container(
            height: 72.h,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'BRAIN WARS',
                    style: kheading1,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Consumer(
                    builder: (context, watch, child) {
                      final toggleform = watch(toggleForm);
                      return Container(
                        height: 60.h,
                        child: AnimatedSwitcher(
                          child:
                              toggleform.show ? SignupForm() : Signinformbody(),
                          duration: Duration(milliseconds: 450),
                          reverseDuration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}

class SignInLoader extends StatelessWidget {
  const SignInLoader({Key key, this.value}) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Color(0xff1a191c),
            strokeWidth: 3,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            value,
            style: kbody1.copyWith(
                color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
