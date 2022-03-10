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
  TextButton _button = TextButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    ),
    onPressed: () {},
    child: Text('Skip'),
  );

  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          Image.asset('assets/images/facebook.png', color: pageImageColor),
          Text('SECURED BACKUP', style: pageTitleStyle),
          Text(
            'Keep your files in closed safe so you can\'t lose them',
            style: pageInfoStyle,
          )
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
        background: Colors.red,
        onPageChange: (int page) {
          if (page == 2) {
            setState(() {
              _button = TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {},
                child: Text('Procced'),
              );
            });
          } else {
            setState(() {
              _button = TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {},
                child: Text('Skip'),
              );
            });
          }
        },
        startPageIndex: 1,
        pages: onboardingPagesList,
        footer: Footer(
          footerPadding: EdgeInsets.only(
            bottom: 10.0,
            left: 10.0,
          ),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {},
            child: Text('TextButton'),
          ),
          indicator: Indicator(
            indicatorDesign: IndicatorDesign.polygon(
              polygonDesign: PolygonDesign(
                  polygon: DesignType.polygon_square, polygonSpacer: 13.0),
            ),
          ),
        ),
      ),
    );
  }
}
