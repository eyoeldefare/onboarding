import 'dart:ui';

import 'package:flutter/material.dart';
import '../onboarding.dart';
import 'utils/constant_util.dart' as util;

class Onboarding extends StatefulWidget {
  ///Change the background of the onboarding. Note that the default is [background = const Color.fromARGB(255, 35, 35, 35)]
  final Color background;

  ///Add pages that are displayed
  final List<PageModel> pages;

  ///Callback function on page transition which allows you to take actions based on the current page
  final Function(int pageIndex)? onPageChange;

  ///The index of the page you want to start with (default starts with 0)
  final int startPageIndex;

  ///Design your own custom footer based around the indicator for your page transition
  final Footer footer;

  const Onboarding({
    Key? key,
    this.background = util.background,
    required this.pages,
    required this.footer,
    this.startPageIndex = 0,
    this.onPageChange,
  }) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late double _netDragDistancePercent;
  late double _dragStartPercent;
  late double _finishedDragStartPercent, _finishedDragEndPercent;
  late Offset _dragStartPosition;
  late AnimationController? _animationController;
  late ValueNotifier<int>? _indexNotifier;

  @override
  void initState() {
    super.initState();
    if (widget.startPageIndex < widget.pages.length &&
        widget.startPageIndex >= 0) {
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

      _indexNotifier = ValueNotifier(_currentIndex);

      if (widget.onPageChange != null) {
        _indexNotifier?.addListener(() {
          widget.onPageChange!(_indexNotifier!.value);
        });
      }
    } else if (widget.startPageIndex >= widget.pages.length) {
      throw Exception(
          "Out of bound exception; The starting page index can't be grater than or equal to the length of your pages.");
    } else if (widget.startPageIndex < 0) {
      throw Exception(
          "Out of bound exception; The starting page index can't be less than 0.");
    }
  }

  int get _currentIndex =>
      (_netDragDistancePercent / (1 / widget.pages.length)).round();

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
    _animationController = null;
    _indexNotifier?.dispose();
    _indexNotifier = null;
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
    _indexNotifier!.value = _currentIndex;
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
            CustomFooter(
              footer: widget.footer,
              background: widget.background,
              pageLength: widget.pages.length,
              netDragDistancePercent: _netDragDistancePercent,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFooter extends StatelessWidget {
  final Footer footer;
  final Color background;
  final double netDragDistancePercent;
  final int pageLength;

  const CustomFooter({
    Key? key,
    required this.footer,
    required this.background,
    required this.pageLength,
    required this.netDragDistancePercent,
  }) : super(key: key);

  Row get _row {
    Row row;
    if (footer.indicatorPosition == IndicatorPosition.center) {
      row = Row(
        mainAxisAlignment: footer.footerMainAxisAlignment!,
        crossAxisAlignment: footer.footerCrossAxisAlignment!,
        children: [
          footer.child,
          CustomIndicator(
            indicator: footer.indicator,
            netDragPercent: netDragDistancePercent,
            pagesLength: pageLength,
          ),
          footer.secondChild!,
        ],
      );
    } else if (footer.indicatorPosition == IndicatorPosition.left) {
      row = Row(
          mainAxisAlignment: footer.footerMainAxisAlignment!,
          crossAxisAlignment: footer.footerCrossAxisAlignment!,
          children: [
            CustomIndicator(
              indicator: footer.indicator,
              netDragPercent: netDragDistancePercent,
              pagesLength: pageLength,
            ),
            footer.child,
            footer.secondChild!,
          ]);
    } else if (footer.indicatorPosition == IndicatorPosition.right) {
      row = Row(
          mainAxisAlignment: footer.footerMainAxisAlignment!,
          crossAxisAlignment: footer.footerCrossAxisAlignment!,
          children: [
            footer.child,
            footer.secondChild!,
            CustomIndicator(
              indicator: footer.indicator,
              netDragPercent: netDragDistancePercent,
              pagesLength: pageLength,
            ),
          ]);
    } else {
      row = Row(
          mainAxisAlignment: footer.footerMainAxisAlignment!,
          crossAxisAlignment: footer.footerCrossAxisAlignment!,
          children: [
            CustomIndicator(
              indicator: footer.indicator,
              netDragPercent: netDragDistancePercent,
              pagesLength: pageLength,
            ),
            footer.secondChild!,
            footer.child
          ]);
    }
    return row;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: footer.footerPadding,
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          width: 0.0,
          color: background,
        ),
      ),
      child: _row,
    );
  }
}
