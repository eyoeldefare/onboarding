import 'package:flutter/material.dart';
import '../models/footer_model.dart';
import '../utils/painter_util.dart';

enum IndicatorPosition {
  left,
  right,
  center,
  none,
}

class CustomIndicator extends StatelessWidget {
  final double netDragPercent;
  final Indicator indicator;
  final int pagesLength;
  final bool shouldPaint;

  const CustomIndicator({
    Key? key,
    required this.netDragPercent,
    required this.indicator,
    required this.pagesLength,
    this.shouldPaint = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShapePainter(
        netDragPercent: netDragPercent,
        indicator: indicator,
        pagesLength: pagesLength,
      ),
      child: const SizedBox(),
    );
  }
}
