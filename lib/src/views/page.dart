import 'package:flutter/material.dart';
import '../models/page_model.dart';

class OnboardPage extends StatelessWidget {
  final PageModel pageModel;
  final double dragPercent;
  final int index;
  final int pagesLength;

  final Color background;
  final EdgeInsets pagesPadding;
  final EdgeInsets titleAndInfoPadding;

  const OnboardPage({
    Key key,
    this.pageModel,
    this.background,
    this.index,
    this.pagesLength,
    this.dragPercent,
    this.pagesPadding,
    this.titleAndInfoPadding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final singlePageScrollPercentage = dragPercent / (1 / pagesLength);
    return FractionalTranslation(
      translation: Offset(index - singlePageScrollPercentage, 0.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.0, color: background),
          color: background,
        ),
        padding: pagesPadding,
        child: Column(
          children: [
            Expanded(child: pageModel.image),
            Container(
              // color: Colors.red,
              padding: titleAndInfoPadding,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [pageModel.title, pageModel.info],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
