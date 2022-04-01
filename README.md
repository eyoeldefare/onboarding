# onboarding

This is a sample flutter onboarding plugin you use to attract first-time users when they land on your page, hence the name onboarding. You can implement this widget anyhow you want in your app, by managing its top-level state to show the widget to users at the appropriate time. There are also many parameters that enable you to design this widget to your liking.

## Environment

`sdk: ">=2.12.0 <3.0.0"`
`flutter: ">=1.17.0"`

## Getting Started

To start using this widget, you will need to first import the package inside your project following the installation guide found on [peb.dev/packages/onboarding](https://pub.dev/packages/onboarding).

```yaml 
  dependencies:
    onboarding: ^3.1.0+
```
`$ flutter pub get`

## Breaking Changes Starting V3.1.0

Please note that versions bellow V3.1.0 will not be supported anymore. Please consider upgrading to V3.1.0+. 
The new changes offer more customization and flexibility to developers with many functionalities. All the functionalities from previous versions are also included. This new change also allows you to build your own custom footer.

Sample examples will be shown bellow from left to right respectively.

[Example 1](https://github.com/eyoeldefare/onboarding/blob/main/example/lib/main.dart)

[Example 2](https://github.com/eyoeldefare/onboarding/blob/main/example/lib/main1.dart)

[Example 3](https://github.com/eyoeldefare/onboarding/blob/main/example/lib/main2.dart)

### Visual Samples For Above Examples
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main1.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main2.gif" width=250>

## Usage
To use this widget, 
1. `import 'package:onboarding/onboarding.dart'; ` inside your dart file
2. Follow the example found at the [`main.dart`](https://github.com/eyoeldefare/onboarding/blob/main/example/lib/main.dart) of the example and implement it in your app. 

### Full Sample Example
``` dart 

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
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
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
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
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
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
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
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
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  width: 0.0,
                  color: background,
                ),
              ),
              child: ColoredBox(
                color: background,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          indicatorDesign: IndicatorDesign.line(
                            lineDesign: LineDesign(
                              lineType: DesignType.line_uniform,
                            ),
                          ),
                        ),
                      ),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

```
### Display With Different Indicators

Sample examples of using different indicator types 

``` dart
    indicator: Indicator(
      indicatorDesign: IndicatorDesign.line(
        lineDesign: LineDesign(
          lineType: DesignType.line_uniform,
        ),
      ),
    )
```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/1.gif" width=300>

``` dart
    indicator: Indicator(
      indicatorDesign: IndicatorDesign.line(
        lineDesign: LineDesign(
          lineType: DesignType.line_nonuniform,
        ),
      ),
    )
```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/2.gif" width=300>

``` dart
    indicator: Indicator(
      indicatorDesign: IndicatorDesign.polygon(
        polygonDesign: PolygonDesign(
          polygon: DesignType.polygon_arrow,
        ),
      ),
    )
```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/3.gif" width=300>

``` dart
    indicator: Indicator(
      indicatorDesign: IndicatorDesign.polygon(
        polygonDesign: PolygonDesign(
          polygon: DesignType.polygon_circle,
        ),
      ),
    )
```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/4.gif" width=300>

``` dart
    indicator: Indicator(
      indicatorDesign: IndicatorDesign.polygon(
        polygonDesign: PolygonDesign(
          polygon: DesignType.polygon_diamond,
        ),
      ),
    )
```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/5.gif" width=300>

``` dart
   indicator: Indicator(
      indicatorDesign: IndicatorDesign.polygon(
        polygonDesign: PolygonDesign(
          polygon: DesignType.polygon_pentagon,
        ),
      ),
    )
```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/6.gif" width=300>

``` dart
    indicator: Indicator(
      indicatorDesign: IndicatorDesign.polygon(
        polygonDesign: PolygonDesign(
          polygon: DesignType.polygon_square,
          polygonSpacer: 14.0
        ),
      ),
    )
```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/7.gif" width=300>