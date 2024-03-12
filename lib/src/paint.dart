import 'dart:ui';

import 'package:flutter/material.dart';

class TriangleDrawer extends ShapePainter {
  final double space;
  final double width;
  TriangleDrawer({
    required final int pagesLength,
    required final double netDragPercent,
    required final int currentPageIndex,
    final Paint? activePainter,
    final Paint? inactivePainter,
    this.space = 10.0,
    this.width = 10.0,
  }) : super(
          netDragPercent: netDragPercent,
          pagesLength: pagesLength,
          inactivePainter: inactivePainter,
          activePainter: activePainter,
          currentPageIndex: currentPageIndex,
        );

  @override
  bool shouldRepaint(covariant TriangleDrawer oldDelegate) {
    return this.width != oldDelegate.width || this.space != oldDelegate.space;
  }

  @override
  paintActiveIndicator(Canvas canvas, Size size, Paint paint, Path path) {
    final Offset offset =
        Offset(netDragPercent * pagesLength * (width + space), 0.0);
    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx, offset.dy + width);
    path.lineTo(offset.dx + width, (offset.dy + width) / 2);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  paintInactiveIndicator(Canvas canvas, Size size, Paint paint, Path path) {
    Offset offset = Offset.zero;
    for (int i = 0; i <= pagesLength - 1; i++) {
      path.moveTo(offset.dx, offset.dy);
      path.lineTo(offset.dx, offset.dy + width);
      path.lineTo(offset.dx + width, (offset.dy + width) / 2);
      path.close();
      offset = Offset(offset.dx + width + space, offset.dy);
    }
    canvas.drawPath(path, paint);
  }
}

class SquareDrawer extends ShapePainter {
  final double space;
  final double width;
  SquareDrawer({
    required double netDragPercent,
    required int pagesLength,
    required int currentPageIndex,
    final Paint? activePainter,
    final Paint? inactivePainter,
    this.space = 10.0,
    this.width = 10.0,
  }) : super(
          netDragPercent: netDragPercent,
          pagesLength: pagesLength,
          inactivePainter: inactivePainter,
          activePainter: activePainter,
          currentPageIndex: currentPageIndex,
        );

  @override
  paintActiveIndicator(Canvas canvas, Size size, Paint paint, Path path) {
    final Offset offset =
        Offset(netDragPercent * pagesLength * (width + space), 0.0);
    path.moveTo(offset.dx, offset.dy);
    path.lineTo(offset.dx + width, offset.dy);
    path.lineTo(offset.dx + width, offset.dy + width);
    path.lineTo(offset.dx, offset.dy + width);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  paintInactiveIndicator(Canvas canvas, Size size, Paint paint, Path path) {
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
}

class CircleDrawer extends ShapePainter {
  final double radius;
  final double space;
  CircleDrawer({
    required double netDragPercent,
    required int pagesLength,
    required int currentPageIndex,
    final Paint? activePainter,
    final Paint? inactivePainter,
    this.space = 10.0,
    this.radius = 10.0,
  }) : super(
          netDragPercent: netDragPercent,
          pagesLength: pagesLength,
          activePainter: activePainter,
          inactivePainter: inactivePainter,
          currentPageIndex: currentPageIndex,
        );

  @override
  paintActiveIndicator(Canvas canvas, Size size, Paint paint, Path path) {
    final Offset offset =
        Offset(netDragPercent * pagesLength * (radius + space), 0.0);
    canvas.drawCircle(offset, radius, paint);
  }

  @override
  paintInactiveIndicator(Canvas canvas, Size size, Paint paint, Path path) {
    Offset offset = Offset.zero;
    for (var i = 0; i <= pagesLength - 1; i++) {
      canvas.drawCircle(offset, radius, paint);
      offset = Offset(offset.dx + radius + space, 0.0);
    }
  }

  @override
  bool shouldRepaint(covariant CircleDrawer oldDelegate) {
    return this.space != oldDelegate.space || this.radius != oldDelegate.radius;
  }
}

class LineDrawer extends ShapePainter {
  final lineWidth;
  LineDrawer({
    required final int pagesLength,
    required final double netDragPercent,
    required final int currentPageIndex,
    final Paint? activePainter,
    final Paint? inactivePainter,
    this.lineWidth = 20.0,
  }) : super(
          netDragPercent: netDragPercent,
          pagesLength: pagesLength,
          inactivePainter: inactivePainter,
          activePainter: activePainter,
          currentPageIndex: currentPageIndex,
        );

  @override
  paintActiveIndicator(Canvas canvas, Size size, Paint paint, Path path) {
    final activeOffset1 = Offset(netDragPercent * lineWidth * pagesLength, 0.0);
    final activeOffset2 = Offset(activeOffset1.dx + lineWidth, 0.0);
    canvas.drawLine(activeOffset1, activeOffset2, paint);
  }

  @override
  paintInactiveIndicator(Canvas canvas, Size size, Paint paint, Path path) {
    final lineW = lineWidth * pagesLength;
    final inActiveOffset1 = Offset(0.0, 0.0);
    final inActiveOffset2 = Offset(lineW, 0.0);
    canvas.drawLine(inActiveOffset1, inActiveOffset2, paint);
  }
}

abstract class ShapePainter extends CustomPainter {
  final double netDragPercent;
  final int pagesLength;
  final int currentPageIndex;

  final Paint activePainter;
  final Paint inactivePainter;
  final Path activePath;
  final Path inactivePath;

  ShapePainter({
    required this.netDragPercent,
    required this.pagesLength,
    required this.currentPageIndex,
    final Paint? activePainter,
    final Paint? inactivePainter,
  })  : activePainter = activePainter == null ? Paint() : activePainter,
        inactivePainter = inactivePainter == null ? Paint() : inactivePainter,
        activePath = Path(),
        inactivePath = Path();

  @override
  void paint(Canvas canvas, Size size) {
    this.paintInactiveIndicator(canvas, size, inactivePainter, inactivePath);
    this.paintActiveIndicator(canvas, size, activePainter, activePath);
  }

  @override
  bool shouldRepaint(covariant ShapePainter oldDelegate) {
    return oldDelegate.netDragPercent != this.netDragPercent ||
        oldDelegate.pagesLength != this.pagesLength;
  }

  paintActiveIndicator(Canvas canvas, Size size, Paint paint, Path path);

  paintInactiveIndicator(Canvas canvas, Size size, Paint paint, Path path);

  // void _createUniformLine(
  //   Canvas canvas,
  //   double width,
  // ) {
  //   //Painter 1
  //   final painter1LineWidth = width * pagesLength;
  //   final painter1Offset1 = Offset(0.0, 0.0);
  //   final painter1Offset2 = Offset(painter1LineWidth, 0.0);

  //   //Painter 2
  //   final painter2LineWidth = painter1LineWidth / pagesLength;
  //   final painer2Offset1 = Offset(netDragPercent * painter1LineWidth, 0.0);
  //   final painer2Offset2 = Offset(painer2Offset1.dx + painter2LineWidth, 0.0);

  //   canvas.drawLine(painter1Offset1, painter1Offset2, painter1);
  //   canvas.drawLine(painer2Offset1, painer2Offset2, painter2);
  // }

  // void _createLine(
  //   Canvas canvas,
  //   int indexer,
  //   Paint paint,
  //   double width,
  //   double spacer,
  // ) {
  //   for (int i = 0; i <= indexer; i++) {
  //     final offset1 = Offset(i * spacer, 0.0);
  //     final offset2 = Offset(offset1.dx + width, 0.0);
  //     canvas.drawLine(offset1, offset2, paint);
  //   }
  // }

  // void _createPolygon({
  //   required Path path,
  //   required int sides,
  //   required int indexer,
  //   required Canvas canvas,
  //   required double radius,
  //   required double spacer,
  //   double? rotateInRadian,
  // }) {
  //   final angle = (math.pi * 2) / sides;
  //   final offset2 = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
  //   for (int m = 0; m <= indexer; m++) {
  //     final offset1 = Offset(m * spacer, 0.0);
  //     path.moveTo(offset2.dx + offset1.dx, offset2.dy + offset1.dy);
  //     for (int i = 1; i <= sides; i++) {
  //       double x = radius * math.cos(angle * i) + offset1.dx;
  //       double y = radius * math.sin(angle * i) + offset1.dy;
  //       path.lineTo(x, y);
  //     }
  //   }
  //   canvas.drawPath(path1, painter1);
  //   canvas.drawPath(path2, painter2);
  // }

  // void _paint(Canvas canvas, Size size) {
  //   final indexer = (netDragPercent / (1 / pagesLength)).round();
  //   final pagesLengthIndexer = pagesLength - 1;
  //   final indicator = something.data;
  //   // final indicatorType =
  //   //     this.indicator.indicatorDesign.polygonDesign?.polygon ??
  //   //         this.indicator.indicatorDesign.lineDesign!.lineType;
  //   // final type = this.indicator1.shape;

  //   if (indicator is Polygon) {
  //     final double? radian = indicator.polygonRotationInDegrees != null
  //         ? indicator.polygonRotationInDegrees! * (math.pi / 180)
  //         : null;
  //     this._createPolygon(
  //       path: path1,
  //       sides: indicator.polygonSides,
  //       indexer: pagesLengthIndexer,
  //       canvas: canvas,
  //       radius: indicator.polygonRadius,
  //       spacer: indicator.polygonSpacer,
  //       rotateInRadian: radian,
  //     );
  //     this._createPolygon(
  //       path: path2,
  //       sides: indicator.polygonSides,
  //       indexer: indexer,
  //       canvas: canvas,
  //       radius: indicator.polygonRadius,
  //       spacer: indicator.polygonSpacer,
  //       rotateInRadian: radian,
  //     );
  //   } else if (indicator is BrokenLine) {
  //     _createLine(canvas, pagesLengthIndexer, painter1, indicator.linesWidth,
  //         indicator.brokenLineSpacer);
  //     _createLine(canvas, indexer, painter2, indicator.linesWidth,
  //         indicator.brokenLineSpacer);
  //   } else if (indicator is UniformLine) {
  //     _createUniformLine(canvas, indicator.linesWidth);
  //   }

  //   // switch (indicatorType) {
  //   //   case DesignType.polygon_circle:
  //   //     _createPolygon(path1, 20, pagesLengthIndexer);
  //   //     _createPolygon(path2, 20, indexer);
  //   //     break;
  //   //   case DesignType.polygon_pentagon:
  //   //     _createPolygon(path1, 5, pagesLengthIndexer);
  //   //     _createPolygon(path2, 5, indexer);
  //   //     break;
  //   //   case DesignType.polygon_square:
  //   //     final radian = (math.pi / 180) * 315;
  //   //     canvas.rotate(radian);
  //   //     _createPolygon(path1, 4, pagesLengthIndexer, rotate: true);
  //   //     _createPolygon(path2, 4, indexer, rotate: true);
  //   //     break;
  //   //   case DesignType.polygon_diamond:
  //   //     _createPolygon(path1, 4, pagesLengthIndexer);
  //   //     _createPolygon(path2, 4, indexer);
  //   //     break;
  //   //   case DesignType.polygon_arrow:
  //   //     _createPolygon(path1, 3, pagesLengthIndexer);
  //   //     _createPolygon(path2, 3, indexer);
  //   //     break;
  //   //   case DesignType.line_nonuniform:
  //   //     // var width = this.indicator.indicatorDesign.lineDesign!.lineWidth;
  //   //     final width = this.indicator1.width;
  //   //     _createLine(canvas, pagesLengthIndexer, painter1, width);
  //   //     _createLine(canvas, indexer, painter2, width);
  //   //     break;
  //   //   case DesignType.line_uniform:
  //   //     final width = this.indicator1.width;
  //   //     _createUniformLine(canvas, width);
  //   //     break;
  //   //   default:
  //   //     return;
  //   // }
  // }
}
