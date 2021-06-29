# onboarding

This is a sample flutter onboarding plugin you use to attract first-time users when they land on your page, hence the name onboarding. You can implement this widget anyhow you want in your app, by managing its top-level state to show the widget to users at the appropriate time. There are also many parameters that enable you to design this widget to your liking.

## Environment

`sdk: ">=2.12.0 <3.0.0"`
`flutter: ">=1.17.0"`

## Getting Started

To start using this widget, you will need to first import the package inside your project following the installation guide found on [peb.dev/packages/onboarding](https://pub.dev/packages/onboarding).

```yaml 
  dependencies:
    onboarding: ^2.0.0
```
`$ flutter pub get`

## Usage

To use this widget, 
1. `import 'package:onboarding/onboarding.dart'; ` inside your dart file
2. Follow the example found at the [`main.dart`](https://github.com/eyoeldefare/onboarding/blob/main/example/lib/main.dart) of the example and implement it in your app. 

### Example
``` dart 
    class MyApp extends StatelessWidget {
      final onboardingPagesList = [
          PageModel(
            widget: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 45.0),
                    child: Image.asset('assets/images/facebook.png',
                        color: pageImageColor)),
                Container(
                    width: double.infinity,
                    child: Text('SECURED BACKUP', style: pageTitleStyle)),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Keep your files in closed safe so you can\'t lose them',
                    style: pageInfoStyle,
                  ),
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
            //-------------Other properties--------------
            //Color background,
            //EdgeInsets pagesContentPadding
            //EdgeInsets titleAndInfoPadding
            //EdgeInsets footerPadding
            //SkipButtonStyle skipButtonStyle
          ),
        );
      }
    }
    
```
### Display

Sample examples of using different indicator types 

``` dart
    Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
                (route) => false,
              );
            }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_uniform,
            ),
          ),
        ),
      )

```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/1.gif" width=300>

``` dart
    Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
                (route) => false,
              );
            }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_nonuniform,
            ),
          ),
        ),
      )

```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/2.gif" width=300>

``` dart
    Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
                (route) => false,
              );
            }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygon: DesignType.polygon_arrow,
            ),
          ),
        ),
      )

```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/3.gif" width=300>

``` dart
    Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
                (route) => false,
              );
            }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygon: DesignType.polygon_circle,
            ),
          ),
        ),
      )

```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/4.gif" width=300>

``` dart
    Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
                (route) => false,
              );
            }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygon: DesignType.polygon_diamond,
            ),
          ),
        ),
      )

```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/5.gif" width=300>

``` dart
    Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
                (route) => false,
              );
            }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygon: DesignType.polygon_pentagon,
            ),
          ),
        ),
      )

```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/6.gif" width=300>

``` dart
    Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Container(),
                ),
                (route) => false,
              );
            }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.polygon(
            polygonDesign: PolygonDesign(
              polygon: DesignType.polygon_square,
              polygonSpacer: 14.0
            ),
          ),
        ),
      )

```
<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/7.gif" width=300>
