import 'package:brain_wars/constants/decoration.dart';
import 'package:brain_wars/constants/textstyles.dart';
import 'package:brain_wars/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class Signinformbody extends StatelessWidget {
  const Signinformbody({
    Key? key,
  }) : super(key: key);

  static final Utility util = Utility();

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
