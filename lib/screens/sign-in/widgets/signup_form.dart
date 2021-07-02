//@dart=2.9
import 'package:brain_wars/bloc/firebase_bloc/firebase_bloc.dart';
import 'package:brain_wars/constants/decoration.dart';
import 'package:brain_wars/constants/regexp.dart';
import 'package:brain_wars/constants/textstyles.dart';
import 'package:brain_wars/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final Utility util = Utility();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: ktfd1,
              style: kbody1,
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => validEmail.hasMatch(value)
                  ? null
                  : 'Please provide a valid email',
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              decoration: ktfd3,
              style: kbody1,
              controller: usernameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) =>
                  value == '' ? 'please enter a username' : null,
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              controller: passwordController,
              decoration: ktfd2,
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: kbody1,
              validator: (value) => strongPass.hasMatch(value)
                  ? null
                  : 'Password must contain aleast:\n- Minimum 8 characters\n- One uppercase character\n- One special character from @#\$&*\n- One digit, 0-9\n-One lowercase character',
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          context.read<FirebaseBloc>().add(
                                SignUp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    username: usernameController.text),
                              );
                      },
                      child: Text(
                        'Sign Up',
                        style: kbody1,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff1a191c),
                        elevation: 4,
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  util.toggleSigninform(context);
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12)),
                child: Text(
                  'Have an account? Login',
                  style: kbody1.copyWith(
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                    color: Colors.transparent,
                    fontWeight: FontWeight.bold,
                    decorationColor: Color(0xff1a191c),
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -3))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
