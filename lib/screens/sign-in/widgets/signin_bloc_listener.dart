//@dart=2.9
import 'package:brain_wars/bloc/firebase_bloc/firebase_bloc.dart';
import 'package:brain_wars/constants/textstyles.dart';
import 'package:brain_wars/screens/home/home_screen.dart';
import 'package:brain_wars/screens/sign-in/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SignInBlocListener extends StatelessWidget {
  const SignInBlocListener({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<FirebaseBloc, FirebaseState>(
      listener: (context, state) {
        if (state is FirebaseFailure) {
          print(state.failureCode);
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              height: 6.h,
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Something went wrong please try again!',
                    style:
                        kbody1.copyWith(color: Colors.white, fontSize: 12.sp),
                  )),
            ),
          );
        }
        if (state is FirebaseSignedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
      },
      child: SigninScreen(),
    );
  }
}
