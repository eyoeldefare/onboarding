import 'dart:ui';

import 'package:flutter/material.dart';

import 'models/indicator_model.dart';
import 'models/page_model.dart';
import 'models/button_model.dart';
import 'utils/constants_util.dart';
import 'views/indicator.dart';
import 'views/page.dart';

class Onboarding extends StatefulWidget {
  ///Change the background of the overall theme. Note that the default is [background = const Color.fromARGB(255, 35, 35, 35)]
  final Color background;

  ///Add pages that are displayed
  final List<PageModel> pages;

  ///Add padding to each of the individual [pages]. Note that the default is [pagesContentPadding = const EdgeInsets.only(top: 45.0, left: 45.0, right: 45.0)]
  final EdgeInsets pagesContentPadding;

  ///Add color to the images of each page's images. Note that the default is [pagesImageColor = const Color.fromARGB(255, 212, 212, 212)]
  final Color pagesImageColor;

  ///Add padding to the title and info container. Note that the default is [titleAndInfoPadding = const EdgeInsets.only(top: 45.0)]
  final EdgeInsets titleAndInfoPadding;

  ///Add height to the container holding the title and info. Note that the default is [titleAndInfoHeight = 210.0]
  final double titleAndInfoHeight;

  ///Add styling to the text of the title. Note that the default is [titleStyle = const TextStyle(fontSize: 23.0,wordSpacing: 1,letterSpacing: 1.2, fontWeight: FontWeight.bold, color: Colors.white)]
  final TextStyle titleStyle;

  ///Add styling to the text of the info. Note that the default is [infoStyle = const TextStyle(color: Colors.white,letterSpacing: 0.7,height: 1.5,)]
  final TextStyle infoStyle;

  ///Add padding to the info container. Note that the default is [infoPadding = const EdgeInsets.only(top: 7.0)]
  final EdgeInsets infoPadding;

  ///Add padding to the container of indicator widget, skip button, and proceeding button. Note that the default is [const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 45.0)]
  final EdgeInsets footerPadding;

  ///Add an indicator widget because it is [required]. This widget gives you a ranch of choice to pick from [DesignType] such as [polygon_diamond],[polygon_arrow],[polygon_pentagon],[polygon_square],[polygon_circle],[line_uniform],[line_nonuniform]
  final Indicator indicator;

  ///Add styling to the skip button
  final SkipButtonStyle skipButtonStyle;

  ///Add a proceeding button [required] after the user reaches the end of the last page in the [pages] you provided
  final ProceedButtonStyle proceedButtonStyle;

  const Onboarding({
    Key key,
    this.background = const Color.fromARGB(255, 35, 35, 35),
    @required this.pages,
    @required this.indicator,
    @required this.proceedButtonStyle,
    this.skipButtonStyle = const SkipButtonStyle(),
    this.footerPadding =
        const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 45.0),
    this.pagesContentPadding =
        const EdgeInsets.only(top: 45.0, left: 45.0, right: 45.0),
    this.pagesImageColor = const Color.fromARGB(255, 212, 212, 212),
    this.titleAndInfoPadding = const EdgeInsets.only(top: 45.0),
    this.titleAndInfoHeight = 210.0,
    this.titleStyle = const TextStyle(
      fontSize: 23.0,
      wordSpacing: 1,
      letterSpacing: 1.2,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.infoStyle = const TextStyle(
      color: Colors.white,
      letterSpacing: 0.7,
      height: 1.5,
    ),
    this.infoPadding = const EdgeInsets.only(top: 7.0),
  }) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  double _netDragDistancePercent;
  double _dragStartPercent;
  double _finishedDragStartPercent, _finishedDragEndPercent;
  Offset _dragStartPosition;
  AnimationController _animationController;
  Material _button;

  Material get _skipButton {
    final _pagesLength = widget.pages.length;
    return Material(
      borderRadius: widget.skipButtonStyle.skipButtonBorderRadius,
      color: widget.skipButtonStyle.skipButtonColor,
      child: InkWell(
        borderRadius: widget.skipButtonStyle.skipButtonBorderRadius,
        onTap: () {
          final end = 1.0 - (1 / _pagesLength);
          setState(() {
            _netDragDistancePercent = end;
          });
        },
        child: Padding(
            padding: widget.skipButtonStyle.skipButtonPadding,
            child: widget.skipButtonStyle.skipButtonText),
      ),
    );
  }

  Material get _proceedButton {
    return Material(
      borderRadius: widget.proceedButtonStyle.proceedButtonBorderRadius,
      color: widget.proceedButtonStyle.proceedButtonColor,
      child: InkWell(
        borderRadius: widget.proceedButtonStyle.proceedButtonBorderRadius,
        onTap: () {
          Future.value(widget.proceedButtonStyle.proceedButtonRoute(context));
        },
        child: Padding(
          padding: widget.proceedButtonStyle.proceedButtonPadding,
          child: widget.proceedButtonStyle.proceedpButtonText,
        ),
      ),
    );
  }

  void _initButtons() {
    final pagesLength = widget.pages.length;
    final index = (_netDragDistancePercent / (1 / pagesLength)).round();

    if (index >= pagesLength - 1) {
      setState(() {
        _button = _proceedButton;
      });
    } else {
      setState(() {
        _button = _skipButton;
      });
    }
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _dragStartPosition = details.globalPosition;
    _dragStartPercent = _netDragDistancePercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final _pagesLength = widget.pages.length;

    final currentPosition = details.globalPosition;
    final dragedDistance = currentPosition.dx - _dragStartPosition.dx;
    final screenWidth = context.size.width;
    final dragDistancePercent = dragedDistance / screenWidth;
    final nddp = (_dragStartPercent + (-dragDistancePercent / _pagesLength))
        .clamp(0.0, 1.0 - (1 / _pagesLength));
    setState(() {
      _netDragDistancePercent = nddp;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final _pagesLength = widget.pages.length;

    _finishedDragStartPercent = _netDragDistancePercent;
    _finishedDragEndPercent =
        (_netDragDistancePercent * _pagesLength).round() / _pagesLength;
    _animationController.forward(from: 0.0);
  }

  @override
  void initState() {
    super.initState();
    _netDragDistancePercent = 0.0;
    _animationController = AnimationController(
      duration: animationDuration,
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
    );

    _animationController.addListener(() {
      final nddp = lerpDouble(_finishedDragStartPercent,
          _finishedDragEndPercent, _animationController.value);
      setState(() {
        _netDragDistancePercent = nddp;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _animationController = null;
  }

  List<OnboardPage> get _getPages {
    final _pagesLength = widget.pages.length;
    int index = 0;
    return widget.pages.map((PageModel pageModel) {
      return OnboardPage(
        pageModel: pageModel,
        index: index++,
        dragPercent: _netDragDistancePercent,
        pagesLength: _pagesLength,
        background: widget.background,
        pagesPadding: widget.pagesContentPadding,
        pagesImageColor: widget.pagesImageColor,
        titleAndInfoPadding: widget.titleAndInfoPadding,
        titleAndInfoHeight: widget.titleAndInfoHeight,
        titleStyle: widget.titleStyle,
        infoStyle: widget.infoStyle,
        infoPadding: widget.infoPadding,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final _pagesLength = widget.pages.length;
    _initButtons();
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: _onHorizontalDragStart,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: _getPages,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: widget.background,
                border: Border.all(
                  width: 0.0,
                  color: widget.background,
                ),
              ),
              padding: widget.footerPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIndicator(
                    indicator: widget.indicator,
                    netDragPercent: _netDragDistancePercent,
                    pagesLength: _pagesLength,
                  ),
                  _button
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
