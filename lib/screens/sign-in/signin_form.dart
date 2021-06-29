import 'package:brain_wars/constants/decoration.dart';
import 'package:brain_wars/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: Column(
          children: [
            Text(
              'BRAIN WARS',
              style: kheading1,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              decoration: ktfd1,
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              decoration: ktfd2,
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {},
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
                          side: BorderSide(color: Color(0xff1a191c)),
                          padding: EdgeInsets.symmetric(
                            vertical: 8,
                          )),
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
                onPressed: () {},
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
                      Shadow(color: Colors.black, offset: Offset(0, -3))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              '© Brain Wars 2021',
              style: kbody1.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            )
          ],
        ),
      ),
    );
  }
}
