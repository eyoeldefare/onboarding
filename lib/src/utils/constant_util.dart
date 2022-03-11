import 'package:flutter/material.dart';
//---------Animation Duration-----------

const animationDuration = Duration(milliseconds: 200);

//---------Onboarding------------
const background = Color.fromARGB(255, 35, 35, 35);
const footerPadding = EdgeInsets.only(left: 45.0, right: 45.0, bottom: 45.0);
const pageContentPadding = EdgeInsets.only(top: 45.0, left: 45.0, right: 45.0);
const pageImageColor = Color.fromARGB(255, 212, 212, 212);
const pageTitleStyle = TextStyle(
  fontSize: 23.0,
  wordSpacing: 1,
  letterSpacing: 1.2,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const pageInfoStyle = TextStyle(
  color: Colors.white,
  letterSpacing: 0.7,
  height: 1.5,
);
const titleAndInfoPadding = EdgeInsets.only(bottom: 45);

//---------Skip button-----------

const defaultSkipButtonColor = Color.fromARGB(255, 93, 93, 93);
const defaultSkipButtonBorderRadius = BorderRadius.all(Radius.circular(20.0));
const defaultSkipButtonPadding =
    EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0);
const defaultSkipButtonTextStyle =
    TextStyle(color: Colors.white, letterSpacing: 1.0);

//---------Signin button-----------

const signinButtonColor = Color.fromARGB(255, 158, 69, 69);
const signinButtonBorderRadius = BorderRadius.all(Radius.circular(20.0));
const signinButtonPadding =
    EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0);
const signinButtonTextStyle =
    TextStyle(color: Colors.white, letterSpacing: 1.0);

//--------Proceed Button---------

const defaultProceedButtonColor = Color.fromARGB(255, 88, 94, 147);
const defaultProceedButtonBorderRadius =
    BorderRadius.all(Radius.circular(20.0));
const defaultProceedButtonPadding =
    EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0);
const defaultProceedButtonTextStyle = TextStyle(
  color: Colors.white,
  letterSpacing: 1.0,
);
