import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45.0,
              vertical: 90.0,
            ),
            child: Image.asset('assets/images/facebook.png',
                color: pageImageColor),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'SECURED BACKUP',
              style: pageTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
              style: pageInfoStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45.0,
              vertical: 90.0,
            ),
            child:
                Image.asset('assets/images/twitter.png', color: pageImageColor),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'CHANGE AND RISE',
              style: pageTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Give others access to any file or folders you choose',
              style: pageInfoStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45.0,
              vertical: 90.0,
            ),
            child: Image.asset('assets/images/instagram.png',
                color: pageImageColor),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'EASY ACCESS',
              style: pageTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Reach your files anytime from any devices anywhere',
              style: pageInfoStyle,
              textAlign: TextAlign.left,
            ),
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

      /**
       * 
       * 
       * const defaultSkipButtonColor = Color.fromARGB(255, 93, 93, 93);
        const defaultSkipButtonBorderRadius = BorderRadius.all(Radius.circular(20.0));
const defaultSkipButtonPadding =
    EdgeInsets.symmetric(horizontal: 17.0, vertical: 5.0);
const defaultSkipButtonTextStyle =
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
       */
      home: Onboarding(
        pages: onboardingPagesList,
        footer: Footer(
          child: Material(
            borderRadius: defaultSkipButtonBorderRadius,
            color: defaultSkipButtonColor,
            child: InkWell(
              borderRadius: defaultSkipButtonBorderRadius,
              onTap: () {},
              child: const Padding(
                padding: defaultSkipButtonPadding,
                child: Text(
                  'Skip',
                  style: defaultSkipButtonTextStyle,
                ),
              ),
            ),
          ),
          indicator: Indicator(
            indicatorDesign: IndicatorDesign.line(
              lineDesign: LineDesign(
                lineType: DesignType.line_uniform,
              ),
            ),
          ),
          footerPadding: const EdgeInsets.all(45.0),
        ),
      ),
    );
  }
}
