import 'package:brain_wars/constants/textstyles.dart';
import 'package:flutter/material.dart';

//email field
InputDecoration ktfd1 = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 2,
    ),
  ),
  hintText: 'Email',
  hintStyle: kbody1,
  contentPadding: EdgeInsets.symmetric(vertical: 04, horizontal: 16),
  prefixIcon: Container(
    width: 24,
    child: Center(
      child: Text(
        '@',
        style: kbody1.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  ),
);

//password field
InputDecoration ktfd2 = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 04, horizontal: 16),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 2,
    ),
  ),
  hintText: 'Password',
  hintStyle: kbody1,
  prefixIcon: Container(
    width: 24,
    child: Center(
        child: Icon(
      Icons.lock_outline,
      color: Colors.black,
    )),
  ),
);
