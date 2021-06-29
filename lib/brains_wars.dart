import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'screens/sign-in/signin.dart';

class BrainWars extends StatelessWidget {
  const BrainWars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brain Wars',
        home: SigninScreen(),
      ),
    );
  }
}
