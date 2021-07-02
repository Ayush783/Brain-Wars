//@dart=2.9
import 'package:brain_wars/screens/sign-in/blocprovider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BrainWars extends StatelessWidget {
  const BrainWars({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brain Wars',
        home: SignInBlocProvider(),
      ),
    );
  }
}
