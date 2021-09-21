//@dart=2.9
import 'package:brain_wars/bloc/firebase_bloc/firebase_bloc.dart';
import 'package:brain_wars/constants/decoration.dart';
import 'package:brain_wars/constants/regexp.dart';
import 'package:brain_wars/constants/textstyles.dart';
import 'package:brain_wars/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class Signinformbody extends StatelessWidget {
  const Signinformbody({
    Key key,
  }) : super(key: key);

  static final Utility util = Utility();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              controller: emailController,
              decoration: ktfd1,
              style: kbody1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => validEmail.hasMatch(value)
                  ? null
                  : 'Please provide a valid email',
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
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          context.read<FirebaseBloc>().add(SignIn(
                              email: emailController.text,
                              password: passwordController.text));
                      },
                      child: Text(
                        'Sign In',
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
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    flex: 2,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/google.svg'),
                      label: Text(''),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        side: BorderSide(color: Color(0xff1a191c), width: 2),
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
                  'Create a new account',
                  style: kbody1.copyWith(
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                    color: Colors.transparent,
                    fontWeight: FontWeight.bold,
                    decorationColor: Color(0xff1a191c),
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -3)),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12)),
                child: Text(
                  'Forgot password',
                  style: kbody1.copyWith(
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    color: Colors.transparent,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.red,
                    shadows: [Shadow(color: Colors.red, offset: Offset(0, -4))],
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
