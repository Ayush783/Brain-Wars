//@dart=2.9
import 'package:brain_wars/constants/textstyles.dart';
import 'package:brain_wars/screens/sign-in/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> scale;
  Animation<double> paddingTop;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    scale = Tween<double>(
      begin: 100,
      end: 30,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.30, curve: Curves.easeInExpo),
      ),
    );
    paddingTop = Tween<double>(begin: 30.h, end: 4.h).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.650, 1.00, curve: Curves.linear),
      ),
    );
    _controller.addListener(() {
      if (_controller.isCompleted) setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, Color(0xfff1f1f1), Color(0xffdcdcdc)],
              focalRadius: 20,
              radius: 0.5,
            ),
          ),
          child: Column(
            children: [
              AnimatedBuilder(
                builder: (context, child) => Padding(
                  padding: EdgeInsets.only(top: paddingTop.value),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: scale.value.w,
                  ),
                ),
                animation: _controller,
              ),
              AnimatedOpacity(
                opacity: _controller.isCompleted ? 1 : 0,
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
                child: SigninForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
