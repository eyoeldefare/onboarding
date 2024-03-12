import 'dart:ui';
import 'package:flutter/material.dart';
import 'paint.dart';

typedef Widget BuiltHeader(
  BuildContext context,
  double netDragDistance,
  int pagesLength,
  int currentIndex,
  void Function(int index) setPageIndex,
);

typedef Widget BuildFooter(
  BuildContext context,
  double netDragDistance,
  int pagesLength,
  int currentIndex,
  void Function(int index) setIndex,
);

typedef void OnPageChanges(int currentIndex);

class Onboarding extends StatefulWidget {
  final BuiltHeader? builtHeader;
  final BuildFooter? buildFooter;
  final OnPageChanges? onPageChanges;
  final List<Widget> swipeableBody;
  final int currentIndex;
  final int animationInMilliseconds;

  const Onboarding({
    Key? key,
    this.builtHeader,
    required this.swipeableBody,
    this.buildFooter,
    this.onPageChanges,
    this.currentIndex = 0,
    this.animationInMilliseconds = 300,
  })  : assert(currentIndex < swipeableBody.length),
        assert(currentIndex >= 0),
        super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late double _netDragDistancePercent;
  late double _dragStartPercent;
  late double _finishedDragStartPercent, _finishedDragEndPercent;
  late Offset _dragStartPosition;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();

    _netDragDistancePercent = widget.currentIndex / getPagesLength;

    _animationController = AnimationController(
      duration: Duration(milliseconds: widget.animationInMilliseconds),
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
    );

    _animationController.addListener(() {
      final double? nddp = lerpDouble(_finishedDragStartPercent,
          _finishedDragEndPercent, _animationController.value);
      setState(() {
        _netDragDistancePercent = nddp!;
      });
    });
  }

  int get getPagesLength => widget.swipeableBody.length;
  int get getCurrentIndex =>
      (_netDragDistancePercent / (1 / getPagesLength)).round();

  @override
  void didUpdateWidget(covariant Onboarding oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex &&
        widget.currentIndex != getCurrentIndex &&
        widget.currentIndex < getPagesLength &&
        widget.currentIndex >= 0) {
      _netDragDistancePercent = widget.currentIndex / getPagesLength;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    _dragStartPosition = details.globalPosition;
    _dragStartPercent = _netDragDistancePercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final Offset currentPosition = details.globalPosition;
    final double dragedDistance = currentPosition.dx - _dragStartPosition.dx;
    final double screenWidth = context.size!.width;
    final double dragDistancePercent = dragedDistance / screenWidth;
    final double nddp =
        (_dragStartPercent + (-dragDistancePercent / getPagesLength))
            .clamp(0.0, 1.0 - (1 / getPagesLength));
    setState(() {
      _netDragDistancePercent = nddp;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    _finishedDragStartPercent = _netDragDistancePercent;
    _finishedDragEndPercent =
        (_netDragDistancePercent * getPagesLength).round() / getPagesLength;
    _animationController.forward(from: 0.0);
    if (widget.onPageChanges != null) {
      widget.onPageChanges!(getCurrentIndex);
    }
  }

  Widget get buildHeader {
    return widget.builtHeader != null
        ? widget.builtHeader!(
            context,
            _netDragDistancePercent,
            getPagesLength,
            getCurrentIndex,
            setIndex,
          )
        : const SizedBox.shrink();
  }

  List<BodyWidget> get buildBody {
    int index = 0;
    return widget.swipeableBody.map((body) {
      return BodyWidget(
        widget: body,
        dragPercent: _netDragDistancePercent,
        index: index++,
        pagesLength: getPagesLength,
      );
    }).toList();
  }

  Widget get buildFooter {
    return widget.buildFooter != null
        ? widget.buildFooter!(
            context,
            _netDragDistancePercent,
            getPagesLength,
            getCurrentIndex,
            setIndex,
          )
        : const SizedBox.shrink();
  }

  void setIndex(int index) {
    if (index != getCurrentIndex && index < getPagesLength && index >= 0) {
      setState(() {
        _netDragDistancePercent = index / getPagesLength;
      });
    }
    // we could possibly throw exceptions if need be
    // else {
    //   throw Exception('#Error');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Column(
        children: [
          buildHeader,
          Expanded(child: Stack(children: buildBody)),
          buildFooter,
        ],
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Widget widget;
  final double dragPercent;
  final int index;
  final int pagesLength;

  const BodyWidget({
    Key? key,
    required this.widget,
    required this.index,
    required this.pagesLength,
    required this.dragPercent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final singlePageScrollPercentage = dragPercent / (1 / pagesLength);
    return FractionalTranslation(
      translation: Offset(index - singlePageScrollPercentage, 0.0),
      child: widget,
    );
  }
}

class Indicator<T extends ShapePainter> extends StatelessWidget {
  final T painter;

  const Indicator({
    Key? key,
    required this.painter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: const SizedBox.shrink(),
    );
  }
}
