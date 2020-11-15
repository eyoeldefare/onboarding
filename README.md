# onboarding

This is a sample flutter onboarding plugin you use to attract first-time users when they land on your page, hence the name onboarding. You can implement this widget anyhow you want in your app, by managing its top-level state to show the widget to users at the appropriate time. There are also many parameters that enable you to design this widget to your liking.

## Environment
`sdk: ">=2.7.0 <3.0.0"`
`flutter: ">=1.17.0 <2.0.0"`

## Thanks...

I like to thank dribble.com and the artist that designed the art work for inspiring me to create this widget. (Unfortunately, I don't remember the exact name of the artist)

## Getting Started

To start using this widget, you will need to first import the package inside your project following the installation guide found on [Flutter.dev](https://flutter.dev).

## Usage

To use this widget, 
1. `import 'package:onboarding/onboarding.dart'; ` inside your dart file
2. Follow the example found at the [`main.dart`](https://github.com/eyoeldefare/onboarding/blob/main/example/lib/main.dart) and implement it in your app. 

### Example
``` dart 
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
            },
            proceedButtonText: 'Sign up',
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
        //background,
        //pagesContentPadding,
        //pagesImageColor,
        //titleAndInfoPadding,
        //titleAndInfoHeight,
        //titleStyle,
        //infoStyle,
        //infoPadding,
        //footerPadding,
        //skipButtonStyle,
      ),
```
### Display

<img src="https://github.com/eyoeldefare/onboarding/blob/main/images/onboarding.gif" width=400>
