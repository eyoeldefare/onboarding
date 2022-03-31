import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../models/footer_model.dart';

class ShapePainter extends CustomPainter {
  final double netDragPercent;
  final Indicator indicator;
  final int pagesLength;
  final bool shouldPaint;

  final Paint painter1 = Paint();
  final Paint painter2 = Paint();
  final Path path1 = Path();
  final Path path2 = Path();

  ShapePainter({
    required this.indicator,
    required this.netDragPercent,
    required this.pagesLength,
    required this.shouldPaint,
  }) {
    painter1.color = this.indicator.activeIndicator.color;
    painter1.strokeWidth = this.indicator.activeIndicator.borderWidth;
    painter1.strokeCap = StrokeCap.round;
    painter1.style = PaintingStyle.stroke;
    //---
    painter2.color = this.indicator.closedIndicator.color;
    painter2.strokeWidth = this.indicator.closedIndicator.borderWidth;
    painter2.strokeCap = StrokeCap.round;
    painter2.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (shouldPaint) _paint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant ShapePainter oldDelegate) {
    return oldDelegate.indicator != this.indicator ||
        oldDelegate.netDragPercent != this.netDragPercent ||
        oldDelegate.pagesLength != this.pagesLength;
  }

  void _createUniformLine(Canvas canvas) {
    //Painter 1
    final width = this.indicator.indicatorDesign.lineDesign!.lineWidth;
    final painter1LineWidth = width * pagesLength;
    final painter1Offset1 = Offset(0.0, 0.0);
    final painter1Offset2 = Offset(painter1LineWidth, 0.0);

    //Painter 2
    final painter2LineWidth = painter1LineWidth / pagesLength;
    final painer2Offset1 = Offset(netDragPercent * painter1LineWidth, 0.0);
    final painer2Offset2 = Offset(painer2Offset1.dx + painter2LineWidth, 0.0);

    canvas.drawLine(painter1Offset1, painter1Offset2, painter1);
    canvas.drawLine(painer2Offset1, painer2Offset2, painter2);
  }

  void _createLine(Canvas canvas, int indexer, Paint paint) {
    var width = this.indicator.indicatorDesign.lineDesign!.lineWidth;
    var spacer = this.indicator.indicatorDesign.lineDesign!.lineSpacer;
    for (int i = 0; i <= indexer; i++) {
      final offset1 = Offset(i * spacer, 0.0);
      final offset2 = Offset(offset1.dx + width, 0.0);
      canvas.drawLine(offset1, offset2, paint);
    }
  }

  void _createPolygon(Path path, int sides, int indexer,
      {bool rotate = false}) {
    var radius = this.indicator.indicatorDesign.polygonDesign!.polygonRadius;
    var spacer = this.indicator.indicatorDesign.polygonDesign!.polygonSpacer;
    final angle = (math.pi * 2) / sides;
    final offset2 = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
    for (int m = 0; m <= indexer; m++) {
      final offset1 =
          rotate ? Offset(m * spacer, m * spacer) : Offset(m * spacer, 0.0);
      path.moveTo(offset2.dx + offset1.dx, offset2.dy + offset1.dy);
      for (int i = 1; i <= sides; i++) {
        double x = radius * math.cos(angle * i) + offset1.dx;
        double y = radius * math.sin(angle * i) + offset1.dy;
        path.lineTo(x, y);
      }
    }
  }

  void _paint(Canvas canvas, Size size) {
    final indexer = (netDragPercent / (1 / pagesLength)).round();
    final pagesLengthIndexer = pagesLength - 1;

    final indicatorType =
        this.indicator.indicatorDesign.polygonDesign?.polygon ??
            this.indicator.indicatorDesign.lineDesign!.lineType;

    switch (indicatorType) {
      case DesignType.polygon_circle:
        _createPolygon(path1, 20, pagesLengthIndexer);
        _createPolygon(path2, 20, indexer);
        break;
      case DesignType.polygon_pentagon:
        _createPolygon(path1, 5, pagesLengthIndexer);
        _createPolygon(path2, 5, indexer);
        break;
      case DesignType.polygon_square:
        final radian = (math.pi / 180) * 315;
        canvas.rotate(radian);
        _createPolygon(path1, 4, pagesLengthIndexer, rotate: true);
        _createPolygon(path2, 4, indexer, rotate: true);
        break;
      case DesignType.polygon_diamond:
        _createPolygon(path1, 4, pagesLengthIndexer);
        _createPolygon(path2, 4, indexer);
        break;
      case DesignType.polygon_arrow:
        _createPolygon(path1, 3, pagesLengthIndexer);
        _createPolygon(path2, 3, indexer);
        break;
      case DesignType.line_nonuniform:
        _createLine(canvas, pagesLengthIndexer, painter1);
        _createLine(canvas, indexer, painter2);
        break;
      case DesignType.line_uniform:
        _createUniformLine(canvas);
        break;
      default:
        return;
    }
    canvas.drawPath(path1, painter1);
    canvas.drawPath(path2, painter2);
  }
}
