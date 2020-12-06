import 'package:flutter/material.dart';
import '../utils/constants_util.dart';

class SkipButtonStyle {
  final Color skipButtonColor;
  final BorderRadius skipButtonBorderRadius;
  final EdgeInsets skipButtonPadding;
  final TextStyle skipButtonTextStyle;

  const SkipButtonStyle({
    this.skipButtonColor = defaultSkipButtonColor,
    this.skipButtonBorderRadius = defaultSkipButtonBorderRadius,
    this.skipButtonPadding = defaultSkipButtonPadding,
    this.skipButtonTextStyle = defaultSkipButtonTextStyle,
  });
}

class ProceedButtonStyle {
  final Color proceedButtonColor;

  ///Your navigation route logic to a new page like login or register
  ///Eg: [Navigator.pushNamed(context, '/login');], [Navigator.push()], etc
  final dynamic Function(BuildContext context) proceedButtonRoute;
  final BorderRadius proceedButtonBorderRadius;
  final EdgeInsets proceedButtonPadding;
  final String proceedButtonText;
  final TextStyle proceedButtonTextStyle;

  const ProceedButtonStyle({
    this.proceedButtonColor = defaultProceedButtonColor,
    this.proceedButtonBorderRadius = defaultProceedButtonBorderRadius,
    this.proceedButtonPadding = defaultProceedButtonPadding,
    this.proceedButtonTextStyle = defaultProceedButtonTextStyle,
    @required this.proceedButtonText,
    @required this.proceedButtonRoute,
  })  : assert(proceedButtonText != null),
        assert(proceedButtonRoute != null);
}
