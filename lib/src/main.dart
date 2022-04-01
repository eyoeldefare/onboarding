import 'dart:ui';

import 'package:flutter/material.dart';
import '../onboarding.dart';
import 'utils/constant_util.dart' as util;

typedef T FooterBuilder<T>(
  BuildContext context,
  double netDragDistance,
  int pagesLength,
  void Function(int index) setIndex,
);

class Onboarding extends StatefulWidget {
  ///Add pages that are displayed
  final List<PageModel> pages;

  ///Callback function on page transition which allows you to take actions based on the current page
  final Function(int pageIndex)? onPageChange;

  ///The index of the page you want to start with (default starts with 0)
  final int startPageIndex;

  ///Build footer
  final FooterBuilder? footerBuilder;

  const Onboarding({
    Key? key,
    required this.pages,
    this.startPageIndex = 0,
    this.onPageChange,
    this.footerBuilder,
  })  : assert(startPageIndex < pages.length),
        assert(startPageIndex >= 0),
        super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late double _netDragDistancePercent;
  late double _dragStartPercent;
  late double _finishedDragStartPercent, _finishedDragEndPercent;
  late Offset _dragStartPosition;
  late AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _netDragDistancePercent = widget.startPageIndex / widget.pages.length;

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

  int get _currentIndex =>
      (_netDragDistancePercent / (1 / widget.pages.length)).round();

  @override
  void didUpdateWidget(covariant Onboarding oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startPageIndex != oldWidget.startPageIndex &&
        widget.startPageIndex != _currentIndex) {
      _checkIndexAssertion(widget.startPageIndex);
    }
  }

  void _checkIndexAssertion(int index) {
    assert(index < widget.pages.length);
    assert(index >= 0);
    _netDragDistancePercent = index / widget.pages.length;
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
    _animationController = null;
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
    widget.onPageChange!(_currentIndex);
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
      );
    }).toList();
  }

  void setIndex(int index) {
    setState(() {
      _checkIndexAssertion(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final fb = widget.footerBuilder;
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Column(
        children: [
          Expanded(child: Stack(children: _getPages)),
          fb != null
              ? fb(
                  context,
                  _netDragDistancePercent,
                  widget.pages.length,
                  setIndex,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
