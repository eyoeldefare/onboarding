import 'package:onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

final onboardingPagesList = [
  DecoratedBox(
    decoration: BoxDecoration(
      color: background,
      border: Border.all(
        width: 0.0,
        color: background,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Image.asset(
            'assets/images/pic_1.png',
          ),
        ),
        const Expanded(
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
  DecoratedBox(
    decoration: BoxDecoration(
      color: background,
      border: Border.all(
        width: 0.0,
        color: background,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Image.asset(
            'assets/images/pic_2.png',
          ),
        ),
        const Expanded(
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
  DecoratedBox(
    decoration: BoxDecoration(
      color: background,
      border: Border.all(
        width: 0.0,
        color: background,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Image.asset(
            'assets/images/pic_3.png',
          ),
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
      ],
    ),
  ),
  DecoratedBox(
    decoration: BoxDecoration(
      color: background,
      border: Border.all(
        width: 0.0,
        color: background,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Image.asset(
            'assets/images/pic_4.png',
          ),
        ),
        const Expanded(
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
      ],
    ),
  ),
];

class LineHeaderIndicator extends StatefulWidget {
  const LineHeaderIndicator({Key? key}) : super(key: key);

  @override
  State<LineHeaderIndicator> createState() => _LineHeaderIndicatorState();
}

class _LineHeaderIndicatorState extends State<LineHeaderIndicator> {
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
          onPageChanges: (_, __, currentIndex, sd) {
            index = currentIndex;
          },
          swipeableBody: onboardingPagesList,
          buildHeader:
              (context, dragDistance, pagesLength, currentIndex, setIndex, sd) {
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
                          slideDirection: sd,
                          lineWidth: 20,
                          translate: false,
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

class TriangleHeaderIndicator extends StatefulWidget {
  const TriangleHeaderIndicator({Key? key}) : super(key: key);

  @override
  State<TriangleHeaderIndicator> createState() =>
      _TriangleHeaderIndicatorState();
}

class _TriangleHeaderIndicatorState extends State<TriangleHeaderIndicator> {
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
          onPageChanges: (_, __, currentIndex, sd) {
            index = currentIndex;
          },
          buildHeader:
              (context, dragDistance, pagesLength, currentIndex, setIndex, sd) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index != pagesLength - 1
                          ? _skipButton(setIndex: setIndex)
                          : const SizedBox(width: width),
                      Expanded(
                        child: Container(
                          color: Colors.red,
                          // Note that the bottom padding must match the wirth of the triangle for transformation
                          padding: const EdgeInsets.only(bottom: 10, right: 0),
                          alignment: Alignment.center,
                          child: Indicator<TrianglePainter>(
                            painter: TrianglePainter(
                              currentPageIndex: currentIndex,
                              pagesLength: pagesLength,
                              netDragPercent: dragDistance,
                              activePainter: activePainter,
                              inactivePainter: inactivePainter,
                              showAllActiveIndicators: false,
                              slideDirection: sd,
                              rotate: true,
                              translate: true,
                              width: 10,
                              space: 10,
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

class CircleHeaderIndicator extends StatefulWidget {
  const CircleHeaderIndicator({Key? key}) : super(key: key);

  @override
  State<CircleHeaderIndicator> createState() => _CircleHeaderIndicatorState();
}

class _CircleHeaderIndicatorState extends State<CircleHeaderIndicator> {
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
      title: 'Onboarding HeaderIndicator 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          swipeableBody: onboardingPagesList,
          startIndex: 0,
          onPageChanges: (_, __, currentIndex, sd) {
            index = currentIndex;
          },
          buildHeader:
              (context, dragDistance, pagesLength, currentIndex, setIndex, sd) {
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
                            slideDirection: sd,
                            radius: 5.0,
                            space: 10.0,
                            showAllActiveIndicators: true,
                            translate: true,
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

class SquareHeaderIndicator extends StatefulWidget {
  const SquareHeaderIndicator({Key? key}) : super(key: key);

  @override
  State<SquareHeaderIndicator> createState() => _SquareHeaderIndicatorState();
}

class _SquareHeaderIndicatorState extends State<SquareHeaderIndicator> {
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
      title: 'Onboarding HeaderIndicator 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
            swipeableBody: onboardingPagesList,
            startIndex: 0,
            onPageChanges: (_, __, currentIndex, sd) {
              index = currentIndex;
            },
            buildHeader: (context, dragDistance, pagesLength, currentIndex,
                setIndex, sd) {
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
                              slideDirection: sd,
                              space: 5,
                              width: 10,
                              showAllActiveIndicators: true,
                              translate: true,
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
