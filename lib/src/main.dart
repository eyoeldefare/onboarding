import 'dart:ui';

import 'package:flutter/material.dart';

import 'models/button_model.dart';
import 'models/indicator_model.dart';
import 'models/page_model.dart';
import 'utils/constant_util.dart' as util;
import 'views/indicator.dart';
import 'views/page.dart';

enum OnboardingSkipMode { Skip, Proceed }

class Onboarding extends StatefulWidget {
  ///Change the background of the overall theme. Note that the default is [background = const Color.fromARGB(255, 35, 35, 35)]
  final Color background;

  ///Add pages that are displayed
  final List<PageModel> pages;

  ///Add padding to each of the individual [pages]. Note that the default is [pagesContentPadding = const EdgeInsets.only(top: 45.0, left: 45.0, right: 45.0)]
  final EdgeInsets pagesContentPadding;

  ///Add padding to the title and info container. Note that the default is [titleAndInfoPadding = const EdgeInsets.only(top: 45.0)]
  final EdgeInsets titleAndInfoPadding;

  ///Add padding to the container of indicator widget, skip button, and proceeding button. Note that the default is [const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 45.0)]
  final EdgeInsets footerPadding;

  ///Add an indicator widget because it is [required]. This widget gives you a ranch of choice to pick from [DesignType] such as [polygon_diamond],[polygon_arrow],[polygon_pentagon],[polygon_square],[polygon_circle],[line_uniform],[line_nonuniform]
  final Indicator indicator;

  ///Add styling to the skip button
  final SkipButtonStyle skipButtonStyle;

  ///Add a proceeding button [required] after the user reaches the end of the last page in the [pages] you provided
  final ProceedButtonStyle proceedButtonStyle;

  ///Skip button visibility
  final bool isSkippable;

  /// [OnboardingSkipMode.Skip] goes to next page but [OnboardingSkipMode.Proceed] triggers proceedButtonRoute()
  /// default to [OnboardingSkipMode.Skip]
  final OnboardingSkipMode skipMode;

  const Onboarding(
      {Key? key,
      this.background = util.background,
      required this.pages,
      required this.indicator,
      required this.proceedButtonStyle,
      this.skipButtonStyle = const SkipButtonStyle(),
      this.footerPadding = util.footerPadding,
      this.pagesContentPadding = util.pageContentPadding,
      this.titleAndInfoPadding = util.titleAndInfoPadding,
      this.isSkippable = true,
      this.skipMode = OnboardingSkipMode.Skip})
      : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late double _netDragDistancePercent;
  late double _dragStartPercent;
  late double _finishedDragStartPercent, _finishedDragEndPercent;
  late Offset _dragStartPosition;
  AnimationController? _animationController;

  Material get _skipButton {
    final int _pagesLength = widget.pages.length;
    return Material(
      borderRadius: widget.skipButtonStyle.skipButtonBorderRadius,
      color: widget.skipButtonStyle.skipButtonColor,
      child: InkWell(
        borderRadius: widget.skipButtonStyle.skipButtonBorderRadius,
        onTap: () {
          if (widget.skipMode == OnboardingSkipMode.Proceed) {
            Future.value(widget.proceedButtonStyle.proceedButtonRoute(context));
            return;
          }

          final double end = 1.0 - (1 / _pagesLength);
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

  int get _currentIndex =>
      (_netDragDistancePercent / (1 / widget.pages.length)).round();

  bool get _isLastPage => _currentIndex >= widget.pages.length - 1;

  Widget get _buildButton {
    if (_isLastPage) {
      return _proceedButton;
    } else {
      return _skipButton;
    }
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _dragStartPosition = details.globalPosition;
    _dragStartPercent = _netDragDistancePercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final int _pagesLength = widget.pages.length;

    final Offset currentPosition = details.globalPosition;
    final double dragedDistance = currentPosition.dx - _dragStartPosition.dx;
    final double screenWidth = context.size!.width;
    final double dragDistancePercent = dragedDistance / screenWidth;
    final double nddp =
        (_dragStartPercent + (-dragDistancePercent / _pagesLength))
            .clamp(0.0, 1.0 - (1 / _pagesLength));
    setState(() {
      _netDragDistancePercent = nddp;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final int _pagesLength = widget.pages.length;

    _finishedDragStartPercent = _netDragDistancePercent;
    _finishedDragEndPercent =
        (_netDragDistancePercent * _pagesLength).round() / _pagesLength;
    _animationController!.forward(from: 0.0);
  }

  @override
  void initState() {
    super.initState();
    _netDragDistancePercent = 0.0;
    _animationController = AnimationController(
      duration: util.animationDuration,
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
    );

    _animationController?.addListener(() {
      final double? nddp = lerpDouble(_finishedDragStartPercent,
          _finishedDragEndPercent, _animationController!.value);
      setState(() {
        _netDragDistancePercent = nddp!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
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
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: _onHorizontalDragStart,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.background,
                  border: Border.all(
                    width: 0.0,
                    color: widget.background,
                  ),
                ),
                child: Stack(
                  children: _getPages,
                ),
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
                    pagesLength: widget.pages.length,
                  ),
                  _actionButton
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _actionButton {
    final isLastPage = !widget.isSkippable && _isLastPage;

    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: widget.isSkippable || isLastPage,
      child: _buildButton,
    );
  }
}
