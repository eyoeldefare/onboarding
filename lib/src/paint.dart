import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:onboarding/onboarding.dart';
import 'package:onboarding/src/main.dart';

class TrianglePainter extends ShapePainter {
  final double space;
  final double width;
  final bool rotate;
  final bool translate;
  TrianglePainter({
    required final int pagesLength,
    required final double netDragPercent,
    required final int currentPageIndex,
    required final SlideDirection slideDirection,
    final Paint? activePainter,
    final Paint? inactivePainter,
    final bool? showAllActiveIndicators,
    this.space = 10.0,
    this.width = 10.0,
    this.rotate = false,
    this.translate = false,
  }) : super(
          netDragPercent: netDragPercent,
          pagesLength: pagesLength,
          inactivePainter: inactivePainter,
          activePainter: activePainter,
          currentPageIndex: currentPageIndex,
          showAllActiveIndicators: showAllActiveIndicators,
          slideDirection: slideDirection,
        );

  @override
  bool shouldRepaint(covariant TrianglePainter oldDelegate) {
    return this.width != oldDelegate.width || this.space != oldDelegate.space;
  }

  @override
  beforeIndicatorsPaint(Canvas canvas, Size size) {
    if (translate) {
      final xTranslation = netDragPercent * pagesLength * (-width - space);
      canvas.transform(Matrix4.translationValues(xTranslation, 0, 0).storage);
    }
    if (rotate) {
      if (slideDirection == SlideDirection.left_to_right) {
        final rotate = Matrix4.identity()..rotateZ(math.pi);
        canvas.translate(0, this.width);
        canvas.transform(rotate.storage);
      }
    }
  }

  @override
  paintActiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    final Offset offset =
        Offset(netDragPercent * pagesLength * (this.width + space), 0.0);
    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx, offset.dy + this.width);
    path.lineTo(offset.dx + this.width, (offset.dy + this.width) / 2);
    path.close();
    canvas.drawPath(path, paint);

    if (showAllActiveIndicators) {
      Offset offset2 = Offset.zero;
      for (int i = 0; i <= currentPageIndex; i++) {
        path.moveTo(offset2.dx, offset2.dy);
        path.lineTo(offset2.dx, offset2.dy + width);
        path.lineTo(offset2.dx + width, (offset2.dy + width) / 2);
        path.close();
        offset2 = Offset(offset2.dx + width + space, 0.0);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  paintInactiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    Offset offset = Offset.zero;
    for (int i = 0; i <= pagesLength - 1; i++) {
      path.moveTo(offset.dx, offset.dy);
      path.lineTo(offset.dx, offset.dy + width);
      path.lineTo(offset.dx + width, (offset.dy + width) / 2);
      path.close();
      offset = Offset(offset.dx + width + space, offset.dy);
    }
    // canvas.rotate(3.14);
    canvas.drawPath(path, paint);
  }
}

class SquarePainter extends ShapePainter {
  final double space;
  final double width;
  final bool translate;
  SquarePainter({
    required double netDragPercent,
    required int pagesLength,
    required int currentPageIndex,
    required final SlideDirection slideDirection,
    final Paint? activePainter,
    final Paint? inactivePainter,
    final bool? showAllActiveIndicators,
    this.space = 10.0,
    this.width = 10.0,
    this.translate = false,
  }) : super(
          netDragPercent: netDragPercent,
          pagesLength: pagesLength,
          inactivePainter: inactivePainter,
          activePainter: activePainter,
          currentPageIndex: currentPageIndex,
          showAllActiveIndicators: showAllActiveIndicators,
          slideDirection: slideDirection,
        );

  @override
  paintActiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    final Offset offset =
        Offset(netDragPercent * pagesLength * (width + space), 0.0);
    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx + width, offset.dy);
    path.lineTo(offset.dx + width, offset.dy + width);
    path.lineTo(offset.dx, offset.dy + width);
    path.close();
    canvas.drawPath(path, paint);

    if (showAllActiveIndicators) {
      Offset offset2 = Offset.zero;
      for (int i = 0; i <= currentPageIndex; i++) {
        path.moveTo(offset2.dx, offset2.dy);
        path.lineTo(offset2.dx + width, offset2.dy);
        path.lineTo(offset2.dx + width, offset2.dy + width);
        path.lineTo(offset2.dx, offset2.dy + width);
        path.close();
        offset2 = Offset(offset2.dx + width + space, 0.0);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  beforeIndicatorsPaint(Canvas canvas, Size size) {
    if (translate) {
      final xTranslation = netDragPercent * pagesLength * (-width - space);
      canvas.transform(Matrix4.translationValues(xTranslation, 0, 0).storage);
    }
  }

  @override
  paintInactiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    Offset offset = Offset.zero;
    for (var i = 0; i <= pagesLength - 1; i++) {
      path.moveTo(offset.dx, offset.dy);
      path.lineTo(offset.dx + width, offset.dy);
      path.lineTo(offset.dx + width, offset.dy + width);
      path.lineTo(offset.dx, offset.dy + width);
      path.close();
      offset = Offset(offset.dx + width + space, offset.dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant SquarePainter oldDelegate) {
    return this.space != oldDelegate.space && this.width != oldDelegate.width;
  }
}

class CirclePainter extends ShapePainter {
  final double radius;
  final double space;
  final bool translate;
  CirclePainter({
    required double netDragPercent,
    required int pagesLength,
    required int currentPageIndex,
    required final SlideDirection slideDirection,
    final Paint? activePainter,
    final Paint? inactivePainter,
    final bool? showAllActiveIndicators,
    this.space = 10.0,
    this.radius = 5.0,
    this.translate = false,
  }) : super(
          netDragPercent: netDragPercent,
          pagesLength: pagesLength,
          activePainter: activePainter,
          inactivePainter: inactivePainter,
          currentPageIndex: currentPageIndex,
          showAllActiveIndicators: showAllActiveIndicators,
          slideDirection: slideDirection,
        );

  @override
  paintActiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    final Offset offset1 =
        Offset(netDragPercent * pagesLength * (radius + space), 0.0);
    canvas.drawCircle(offset1, radius, paint);

    if (showAllActiveIndicators) {
      Offset offset2 = Offset.zero;
      for (int i = 0; i <= currentPageIndex; i++) {
        canvas.drawCircle(offset2, radius, paint);
        offset2 = Offset(offset2.dx + radius + space, 0.0);
      }
    }
  }

  @override
  beforeIndicatorsPaint(Canvas canvas, Size size) {
    if (translate) {
      final xTranslation = netDragPercent * pagesLength * (-radius - space);
      canvas.transform(Matrix4.translationValues(xTranslation, 0, 0).storage);
    }
  }

  @override
  paintInactiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    Offset offset = Offset.zero;
    for (int i = 0; i <= pagesLength - 1; i++) {
      canvas.drawCircle(offset, radius, paint);
      offset = Offset(offset.dx + radius + space, 0.0);
    }
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return this.space != oldDelegate.space || this.radius != oldDelegate.radius;
  }
}

class LinePainter extends ShapePainter {
  final double lineWidth;
  final bool translate;
  LinePainter({
    required final int pagesLength,
    required final double netDragPercent,
    required final int currentPageIndex,
    required final SlideDirection slideDirection,
    final Paint? activePainter,
    final Paint? inactivePainter,
    final bool? showAllActiveIndicators,
    this.lineWidth = 20.0,
    this.translate = false,
  }) : super(
          netDragPercent: netDragPercent,
          pagesLength: pagesLength,
          inactivePainter: inactivePainter,
          activePainter: activePainter,
          currentPageIndex: currentPageIndex,
          showAllActiveIndicators: showAllActiveIndicators,
          slideDirection: slideDirection,
        );

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    return oldDelegate.lineWidth != this.lineWidth;
  }

  @override
  beforeIndicatorsPaint(Canvas canvas, Size size) {
    if (translate) {
      final xTranslation = netDragPercent * pagesLength * (-lineWidth);
      canvas.transform(Matrix4.translationValues(xTranslation, 0, 0).storage);
    }
  }

  @override
  paintActiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    final activeOffset1 = Offset(netDragPercent * lineWidth * pagesLength, 0.0);
    final activeOffset2 = Offset(activeOffset1.dx + lineWidth, 0.0);
    canvas.drawLine(activeOffset1, activeOffset2, paint);
  }

  @override
  paintInactiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    final inActiveOffset = Offset(lineWidth * pagesLength, 0.0);
    canvas.drawLine(Offset.zero, inActiveOffset, paint);
  }
}

abstract class ShapePainter extends CustomPainter {
  final double netDragPercent;
  final int pagesLength;
  final int currentPageIndex;
  final SlideDirection slideDirection;

  final bool showAllActiveIndicators;
  final Paint activePainter;
  final Paint inactivePainter;

  final Path activePath;
  final Path inactivePath;

  ShapePainter({
    required this.netDragPercent,
    required this.pagesLength,
    required this.currentPageIndex,
    required this.slideDirection,
    final Paint? activePainter,
    final Paint? inactivePainter,
    final bool? showAllActiveIndicators,
  })  : activePainter = activePainter == null ? Paint() : activePainter,
        inactivePainter = inactivePainter == null ? Paint() : inactivePainter,
        showAllActiveIndicators =
            showAllActiveIndicators == null ? false : showAllActiveIndicators,
        activePath = Path(),
        inactivePath = Path();

  @override
  void paint(Canvas canvas, Size size) {
    this.beforeIndicatorsPaint(canvas, size);
    this.paintInactiveIndicators(canvas, size, inactivePainter, inactivePath);
    this.paintActiveIndicators(canvas, size, activePainter, activePath);
  }

  @override
  bool shouldRepaint(covariant ShapePainter oldDelegate) {
    return (oldDelegate.netDragPercent != this.netDragPercent ||
        oldDelegate.pagesLength != this.pagesLength ||
        oldDelegate.currentPageIndex != this.currentPageIndex ||
        oldDelegate.activePainter != this.activePainter ||
        oldDelegate.inactivePainter != this.inactivePainter ||
        oldDelegate.showAllActiveIndicators != this.showAllActiveIndicators ||
        oldDelegate.slideDirection != this.slideDirection);
  }

  paintActiveIndicators(Canvas canvas, Size size, Paint paint, Path path);
  paintInactiveIndicators(Canvas canvas, Size size, Paint paint, Path path);
  beforeIndicatorsPaint(Canvas canvas, Size size) {}
}
