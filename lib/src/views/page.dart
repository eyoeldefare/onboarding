import 'package:flutter/material.dart';
import '../models/page_model.dart';

class OnboardPage extends StatelessWidget {
  final PageModel pageModel;
  final double dragPercent;
  final int index;
  final int pagesLength;
  final Color background;

  const OnboardPage({
    Key? key,
    required this.pageModel,
    required this.background,
    required this.index,
    required this.pagesLength,
    required this.dragPercent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final singlePageScrollPercentage = dragPercent / (1 / pagesLength);
    return FractionalTranslation(
      translation: Offset(index - singlePageScrollPercentage, 0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.0,
            color: background,
          ),
          color: background,
        ),
        child: pageModel.widget,
      ),
    );
  }
}
