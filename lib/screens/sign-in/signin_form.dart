import 'package:brain_wars/constants/decoration.dart';
import 'package:brain_wars/constants/textstyles.dart';
import 'package:brain_wars/providers/toggle_form_provider.dart';
import 'package:brain_wars/screens/sign-in/signup_form.dart';
import 'package:brain_wars/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final PageController pageController = PageController(initialPage: 0);
  FirestoreService service = FirestoreService();
  Widget? form;

  @override
  void initState() {
    super.initState();
    form = Signinformbody(pageController: pageController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: toggleform.show
                    ? SignupForm(
                        pageController: pageController,
                      )
                    : Signinformbody(pageController: pageController),
                duration: Duration(milliseconds: 450),
                reverseDuration: Duration(milliseconds: 100),
              ),
            );
          },
        )
      ],
    );
  }
}

class Signinformbody extends StatelessWidget {
  const Signinformbody({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

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
                  context.read(toggleForm).toggle();
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
