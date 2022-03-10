import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          Image.asset('assets/images/facebook.png', color: pageImageColor),
          Text('SECURED BACKUP', style: pageTitleStyle),
          Text(
            'Keep your files in closed safe so you can\'t lose them',
            style: pageInfoStyle,
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Image.asset('assets/images/twitter.png', color: pageImageColor),
          Text('CHANGE AND RISE', style: pageTitleStyle),
          Text(
            'Give others access to any file or folder you choose',
            style: pageInfoStyle,
          )
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Image.asset('assets/images/instagram.png', color: pageImageColor),
          Text('EASY ACCESS', style: pageTitleStyle),
          Text(
            'Reach your files anytime from any devices anywhere',
            style: pageInfoStyle,
          ),
        ],
      ),
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
        onPageChange: (page) => print(page),
        startPageIndex: 0,
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
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
                polygon: DesignType.polygon_square, polygonSpacer: 13.0),
          ),
        ),
      ),
    );
  }
}
