import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Material materialButton;
  final onboardingPagesList = [
    PageModel(
      widget: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: Image.asset('assets/images/facebook.png',
                  color: pageImageColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SECURED BACKUP',
                  style: pageTitleStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                  style: pageInfoStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                  style: pageInfoStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                  style: pageInfoStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                  style: pageInfoStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: Image.asset('assets/images/twitter.png',
                  color: pageImageColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CHANGE AND RISE',
                  style: pageTitleStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Give others access to any file or folders you choose',
                  style: pageInfoStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      widget: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: Image.asset('assets/images/instagram.png',
                  color: pageImageColor),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'EASY ACCESS',
                  style: pageTitleStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Reach your files anytime from any devices anywhere',
                  style: pageInfoStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton;
  }

  set _buildButton(int pageIndex) {
    if (pageIndex == 2) {
      setState(() {
        materialButton = _signupButton;
      });
    } else {
      setState(() {
        materialButton = _skipButton;
      });
    }
  }

  Material get _skipButton {
    return Material(
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
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {},
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

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
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          _buildButton = pageIndex;
        },
        footer: Footer(
          child: materialButton,
          secondChild: const SizedBox(),
          indicator: Indicator(
            indicatorDesign: IndicatorDesign.line(
              lineDesign: LineDesign(
                lineType: DesignType.line_uniform,
              ),
            ),
          ),
          // indicatorPosition: IndicatorPosition.center,
          footerPadding: const EdgeInsets.all(45.0),
        ),
      ),
    );
  }
}
