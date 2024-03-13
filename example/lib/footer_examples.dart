import 'package:onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

final onboardingPagesList = [
  SizedBox(
    height: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0.0,
          color: background,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Image.asset(
              'assets/images/pic_1.png',
            ),
          ),
          const SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'SECURE IT SOLUTIONS',
                      style: pageTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'We provide a secure network and data management solutions. We handle all the networking and IT side of your business and let you worry about running your actual business',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
  SizedBox(
    height: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0.0,
          color: background,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Image.asset(
              'assets/images/pic_2.png',
            ),
          ),
          const SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'BUSINESS NETWORK SOLUTIONS',
                      style: pageTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'We provide a scalable, reliable, and cost-effective network solutions to 100s of businesses in the DMV area.',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Text(
                      'We set up business networks, VPNs, IP cameras, on-site server, etc for a fraction of the cost most IT companies charge',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
  SizedBox(
    height: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0.0,
          color: background,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Image.asset(
              'assets/images/pic_3.png',
            ),
          ),
          const SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'STORAGE & BACKUP SOLUTIONS',
                      style: pageTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'As the integrity and value of your company\'s data is most vital, we offer a multitude of solutions in safekeeping, managing, storing, and backing up your data.',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Text(
                      'Whether you choose an on-site or remote storage solutions, we\'ll help you pick and setup the best choice',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
  SizedBox(
    height: double.infinity,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0.0,
          color: background,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Image.asset(
              'assets/images/pic_4.png',
            ),
          ),
          const SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'WEBSITES & APPS DEVELOPMENT',
                      style: pageTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      'We\'ll build and maintain all your websites and mobile applications. Weather you\'re running a real estate business, consulting, e-commerce, etc, we\'ve got you covered.',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
];

class LineFooterIndicator extends StatefulWidget {
  const LineFooterIndicator({Key? key}) : super(key: key);

  @override
  State<LineFooterIndicator> createState() => _LineFooterIndicatorState();
}

class _LineFooterIndicatorState extends State<LineFooterIndicator> {
  late Material materialButton;
  late int index;
  final activePainter = Paint();
  final inactivePainter = Paint();

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;

    activePainter.color = Colors.white;
    activePainter.strokeWidth = 1;
    activePainter.strokeCap = StrokeCap.round;
    activePainter.style = PaintingStyle.stroke;

    inactivePainter.color = pageImageColor;
    inactivePainter.strokeWidth = 1;
    inactivePainter.strokeCap = StrokeCap.round;
    inactivePainter.style = PaintingStyle.fill;

    // activePainter.color = pageImageColor;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 3;
            setIndex(3);
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
          startIndex: 0,
          onPageChanges: (_, __, currentIndex) {
            index = currentIndex;
          },
          swipeableBody: onboardingPagesList,
          buildFooter:
              (context, dragDistance, pagesLength, currentIndex, setIndex) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Indicator<LinePainter>(
                        painter: LinePainter(
                          currentPageIndex: currentIndex,
                          pagesLength: pagesLength,
                          netDragPercent: dragDistance,
                          activePainter: activePainter,
                          inactivePainter: inactivePainter,
                          lineWidth: 20,
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

class TriangleFooterIndicator extends StatefulWidget {
  const TriangleFooterIndicator({Key? key}) : super(key: key);

  @override
  State<TriangleFooterIndicator> createState() =>
      _TriangleFooterIndicatorState();
}

class _TriangleFooterIndicatorState extends State<TriangleFooterIndicator> {
  late int index;
  final activePainter = Paint();
  final inactivePainter = Paint();

  static const width = 100.0;
  @override
  void initState() {
    super.initState();
    index = 0;
    activePainter.color = Colors.white;
    activePainter.strokeWidth = 0.7;
    activePainter.strokeCap = StrokeCap.round;
    activePainter.style = PaintingStyle.fill;

    inactivePainter.color = pageImageColor;
    inactivePainter.strokeWidth = 0.7;
    inactivePainter.strokeCap = StrokeCap.round;
    inactivePainter.style = PaintingStyle.stroke;
  }

  SizedBox get _signinButton {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerRight,
        child: Material(
          borderRadius: signinButtonBorderRadius,
          color: signinButtonColor,
          child: InkWell(
            borderRadius: signinButtonBorderRadius,
            onTap: () {},
            child: const Padding(
              padding: signinButtonPadding,
              child: Text(
                'Sign in',
                style: signinButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _skipButton({void Function(int)? setIndex}) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          borderRadius: defaultSkipButtonBorderRadius,
          color: defaultSkipButtonColor,
          child: InkWell(
            borderRadius: defaultSkipButtonBorderRadius,
            onTap: () {
              if (setIndex != null) {
                index = 3;
                setIndex(3);
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
        ),
      ),
    );
  }

  SizedBox get _signupButton {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerRight,
        child: Material(
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
          swipeableBody: onboardingPagesList,
          startIndex: 0,
          onPageChanges: (_, __, currentIndex) {
            index = currentIndex;
          },
          buildFooter:
              (context, dragDistance, pagesLength, currentIndex, setIndex) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index != pagesLength - 1
                          ? _skipButton(setIndex: setIndex)
                          : const SizedBox(width: width),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Indicator<TrianglePainter>(
                            painter: TrianglePainter(
                              currentPageIndex: currentIndex,
                              pagesLength: pagesLength,
                              netDragPercent: dragDistance,
                              activePainter: activePainter,
                              inactivePainter: inactivePainter,
                              showAllActiveIndicators: false,
                            ),
                          ),
                        ),
                      ),
                      index != pagesLength - 1 ? _signupButton : _signinButton,
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

class CircleFooterIndicator extends StatefulWidget {
  const CircleFooterIndicator({Key? key}) : super(key: key);

  @override
  State<CircleFooterIndicator> createState() => _CircleFooterIndicatorState();
}

class _CircleFooterIndicatorState extends State<CircleFooterIndicator> {
  late int index;
  final activePainter = Paint();
  final inactivePainter = Paint();

  static const width = 100.0;

  SizedBox _skipButton({void Function(int)? setIndex}) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          borderRadius: defaultSkipButtonBorderRadius,
          color: defaultSkipButtonColor,
          child: InkWell(
            borderRadius: defaultSkipButtonBorderRadius,
            onTap: () {
              if (setIndex != null) {
                index = 3;
                setIndex(3);
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
        ),
      ),
    );
  }

  SizedBox get _signupButton {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
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
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    index = 0;
    activePainter.color = Colors.white;
    activePainter.strokeWidth = 1;
    activePainter.strokeCap = StrokeCap.round;
    activePainter.style = PaintingStyle.fill;

    inactivePainter.color = pageImageColor;
    inactivePainter.strokeWidth = 1;
    inactivePainter.strokeCap = StrokeCap.round;
    inactivePainter.style = PaintingStyle.stroke;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding FooterIndicator 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          swipeableBody: onboardingPagesList,
          startIndex: 0,
          onPageChanges: (_, __, currentIndex) {
            index = currentIndex;
          },
          buildFooter:
              (context, dragDistance, pagesLength, currentIndex, setIndex) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index != pagesLength - 1
                          ? _skipButton(setIndex: setIndex)
                          : _signupButton,
                      Padding(
                        padding: const EdgeInsets.only(right: 45.0),
                        child: Indicator<CirclePainter>(
                          painter: CirclePainter(
                            currentPageIndex: currentIndex,
                            pagesLength: pagesLength,
                            netDragPercent: dragDistance,
                            activePainter: activePainter,
                            inactivePainter: inactivePainter,
                            radius: 5.0,
                            space: 10.0,
                            showAllActiveIndicators: false,
                          ),
                        ),
                      ),
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

class SquareFooterIndicator extends StatefulWidget {
  const SquareFooterIndicator({Key? key}) : super(key: key);

  @override
  State<SquareFooterIndicator> createState() => _SquareFooterIndicatorState();
}

class _SquareFooterIndicatorState extends State<SquareFooterIndicator> {
  late int index;
  final activePainter = Paint();
  final inactivePainter = Paint();

  static const width = 100.0;
  @override
  void initState() {
    super.initState();
    index = 0;
    activePainter.color = Colors.white;
    activePainter.strokeWidth = 1;
    activePainter.strokeCap = StrokeCap.round;
    activePainter.style = PaintingStyle.fill;

    inactivePainter.color = pageImageColor;
    inactivePainter.strokeWidth = 1;
    inactivePainter.strokeCap = StrokeCap.round;
    inactivePainter.style = PaintingStyle.stroke;
  }

  SizedBox _skipButton({void Function(int)? setIndex}) {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          borderRadius: defaultSkipButtonBorderRadius,
          color: defaultSkipButtonColor,
          child: InkWell(
            borderRadius: defaultSkipButtonBorderRadius,
            onTap: () {
              if (setIndex != null) {
                index = 3;
                setIndex(3);
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
        ),
      ),
    );
  }

  SizedBox get _signupButton {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding FooterIndicator 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
            swipeableBody: onboardingPagesList,
            startIndex: 0,
            onPageChanges: (_, __, currentIndex) {
              index = currentIndex;
            },
            buildFooter:
                (context, dragDistance, pagesLength, currentIndex, setIndex) {
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        index != pagesLength - 1
                            ? _skipButton(setIndex: setIndex)
                            : _signupButton,
                        Padding(
                          padding: const EdgeInsets.only(right: 45.0),
                          child: Indicator<SquarePainter>(
                            painter: SquarePainter(
                              currentPageIndex: index,
                              pagesLength: pagesLength,
                              netDragPercent: dragDistance,
                              activePainter: activePainter,
                              inactivePainter: inactivePainter,
                              space: 5,
                              width: 10,
                              showAllActiveIndicators: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
