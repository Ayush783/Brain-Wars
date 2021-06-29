import 'package:brain_wars/constants/decoration.dart';
import 'package:brain_wars/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SignupForm extends StatefulWidget {
  final PageController? pageController;
  const SignupForm({Key? key, this.pageController}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: ktfd1,
              style: kbody1,
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              decoration: ktfd3,
              style: kbody1,
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              decoration: ktfd2,
              obscureText: true,
              style: kbody1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
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
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  widget.pageController!.animateToPage(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.bounceInOut);
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