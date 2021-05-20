import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final onboardingPagesList = [
    PageModel(
      assetPath: 'assets/images/facebook.png',
      title: 'SECURED BACKUP',
      info: "Keep your files in closed safe so you can't lose them",
    ),
    PageModel(
      assetPath: 'assets/images/twitter.png',
      title: 'CHANGE AND RISE',
      info: 'Give others access to any file or folder you choose',
    ),
    PageModel(
      assetPath: 'assets/images/instagram.png',
      title: 'EASY ACCESS',
      info: 'Reach your files anytime from any devices anywhere',
    ),
    PageModel(
      assetPath: 'assets/images/twitter.png',
      title: 'SHARE AND SHINE',
      info: 'Give others access to any file or folder you choose',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
          proceedButtonRoute: (context) {
            return Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Container(),
              ),
              (route) => false,
            );
          },
        ),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_uniform,
            ),
          ),
        ),
      ),
    );
  }
}
