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
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        else if (state is FetchingData)
          return SignInLoader(
            value: 'Fetching data...',
          );
        else if (state is FirebaseVerifyingEmail)
          return Container(
            height: 54.h,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'A verification link must have arrived in your inbox, Kindly click on it to verify your email.',
                    style: kbody1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Re-create your account'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff1a191c),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                  ),
                ],
              ),
            ),
          );
        else
          return Container(
            height: 54.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'BRAIN WARS',
                  style: kheading1,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Consumer(
                  builder: (context, watch, child) {
                    final toggleform = watch(toggleForm);
                    return Container(
                      height: 40.h,
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
      height: 54.h,
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
