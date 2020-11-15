import 'package:flutter/material.dart';
import '../models/indicator_model.dart';
import '../utils/painter_util.dart';

class CustomIndicator extends StatelessWidget {
  final double netDragPercent;
  final Indicator indicator;
  final int pagesLength;

  const CustomIndicator({
    Key key,
    this.netDragPercent,
    this.indicator,
    this.pagesLength,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapePainter(
        netDragPercent: netDragPercent,
        indicator: indicator,
        pagesLength: pagesLength,
      ),
      child: SizedBox(),
    );
  }
}
