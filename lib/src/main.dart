import 'dart:ui';
import 'package:flutter/material.dart';
import 'paint.dart';

enum SlideDirection {
  left_to_right,
  right_to_left,
  none,
}

typedef Widget BuiltHeader(
  BuildContext context,
  double netDragDistance,
  int pagesLength,
  int currentIndex,
  void Function(int index) setPageIndex,
  SlideDirection slideDirection,
);

typedef Widget BuildFooter(
  BuildContext context,
  double netDragDistance,
  int pagesLength,
  int currentIndex,
  void Function(int index) setIndex,
  SlideDirection slideDirection,
);

typedef void OnPageChanges(
  double netDragDistance,
  int pagesLength,
  int currentIndex,
  SlideDirection slideDirection,
);

class Onboarding extends StatefulWidget {
  final BuiltHeader? buildHeader;
  final BuildFooter? buildFooter;
  final OnPageChanges? onPageChanges;
  final List<Widget> swipeableBody;
  final int startIndex;
  final int animationInMilliseconds;

  const Onboarding({
    Key? key,
    this.buildHeader,
    required this.swipeableBody,
    this.buildFooter,
    this.onPageChanges,
    this.startIndex = 0,
    this.animationInMilliseconds = 300,
  })  : assert(startIndex < swipeableBody.length),
        assert(startIndex >= 0),
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
  late SlideDirection _slideDirection;
  @override
  void initState() {
    super.initState();
    _slideDirection = SlideDirection.none;
    _netDragDistancePercent = widget.startIndex / getPagesLength;

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
    if (widget.startIndex != oldWidget.startIndex &&
        widget.startIndex != getCurrentIndex &&
        widget.startIndex < getPagesLength &&
        widget.startIndex >= 0) {
      _netDragDistancePercent = widget.startIndex / getPagesLength;
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
    _setSlideDirection(dragedDistance);
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    _finishedDragStartPercent = _netDragDistancePercent;
    _finishedDragEndPercent =
        (_netDragDistancePercent * getPagesLength).round() / getPagesLength;
    _animationController.forward(from: 0.0);
    if (widget.onPageChanges != null) {
      widget.onPageChanges!(
        _netDragDistancePercent,
        getPagesLength,
        getCurrentIndex,
        _slideDirection,
      );
    }
  }

  void _setSlideDirection(double dragedDistance) {
    if (dragedDistance > 0) {
      _slideDirection = SlideDirection.left_to_right;
    } else if (dragedDistance < 0) {
      _slideDirection = SlideDirection.right_to_left;
    } else {
      _slideDirection = SlideDirection.none;
    }
  }

  void _setIndex(int index) {
    if (index != getCurrentIndex && index < getPagesLength && index >= 0) {
      setState(() {
        _netDragDistancePercent = index / getPagesLength;
      });
    } else if (index >= getPagesLength || index < 0) {
      throw Exception('Enter a proper page index');
    }
  }

  Widget get buildHeader {
    return widget.buildHeader != null
        ? widget.buildHeader!(
            context,
            _netDragDistancePercent,
            getPagesLength,
            getCurrentIndex,
            _setIndex,
            _slideDirection,
          )
        : const SizedBox.shrink();
  }

  List<_BodyWidget> get buildBody {
    int index = 0;
    return widget.swipeableBody.map((body) {
      return _BodyWidget(
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
            _setIndex,
            _slideDirection,
          )
        : const SizedBox.shrink();
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

class _BodyWidget extends StatelessWidget {
  final Widget widget;
  final double dragPercent;
  final int index;
  final int pagesLength;

  const _BodyWidget({
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
