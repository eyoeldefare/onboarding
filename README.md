# onboarding

Onboarding is a sample flutter onboarding plugin you can use to attract first-time users when they land on your page, hence the name onboarding. The widget gives you a header and footer builder along side your swipe-able widget. The widget also gives you a painter base class you can extend to build your own custom indicators.

## Environment

`sdk: ">=2.12.0 <3.0.0"`

`flutter: ">=1.17.0"`

## Getting Started

To get started using this widget, you will need to first import the package inside your project following the installation guide found on [peb.dev/packages/onboarding](https://pub.dev/packages/onboarding).

```yaml 
  dependencies:
    onboarding: ^4.0.0+
```
`$ flutter pub get`

## Usage
To use this widget, 
1. `import 'package:onboarding/onboarding.dart'; ` inside your dart file

2.  Utilize the widget as bellow:
```dart 
Onboarding(
  swipeableBody: ..., //[List<Widget>] - List of swipeable widgets 
  startIndex: ..., //[int] - the starting index of the swipeable widgets
  onPageChanges:(netDragDistance,pagesLength,currentIndex, slideDirection){
    //1) [pagesLength] The drage distance from swipping
    //2) [pagesLength] The length of the swipeable widgets
    //3) [currentIndex] The currect index 
    //4) [slideDirection] The slide direction
  },
  buildHeader:(context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection){
    //Use this to build a header in your onboarding that will display at all times. (Used to build routing buttons, indicators, etc)
    //This is same as onPageChanges but with [setIndex] added to allow u to change the index from this header
  },
  buildFooter:(context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection){
    //Use this to build a footer in your onboarding that will display at all times. (Used to build routing buttons, indicators, etc)
  },
  animationInMilliseconds: ..., //[int] - the speed of animations in ms
)
```

3. There are 4 built-in indicator painters: `LinePainter`, `CirclePainter`, `SquarePainter`, and `TrianglePainter`. You can get started right away with these indicators as shown in the UI example demonstrations.

4. If you want custom indicators to show your page changes, look at the example section bellow showing how to create custom indicators

## Examples With Different Indicators
This widget uses the custom painter class to render the page changing indicators used to show the progress of the pages swiped. As such, we've designed this widget to enable you to access the `CustomerPainter`'s functionalities through the `ShapePainter` class to be able to draw your own custom indicators. By default, the widget comes with 4 simple painters that render commonly used shapes. The 4 default painters are `LinePainter`, `CirclePainter`, `SquarePainter`, and `TrianglePainter`. All the example UIs shown bellow are using these painters and there are examples in the example folder showing you how to use these indicators.

### Examples with default indicators
These examples are using the default indicator painter that come with this widget.

<img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_1.gif" width=250> <img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_2.gif" width=250> <img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_3.gif" width=250> 

<img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_4.gif" width=250> <img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_5.gif" width=250> <img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_6.gif" width=250> 

<img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_7.gif" width=250> <img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_8.gif" width=250>

#### Sample Indicator Usage
Once you have decided to place your indicator in your app, simple pick your indicator painter choice from `LinePainter`, `TrianglePainter`, `CirclePainter`, `SquarePainter`, or your own custom painter and use it like the example bellow showing `LinePainter` painter example.

``` dart 
Indicator<LinePainter>(
  painter: LinePainter(
    currentPageIndex: currentIndex,
    pagesLength: pagesLength,
    netDragPercent: dragDistance,
    activePainter: activePainter,
    inactivePainter: inactivePainter,
    lineWidth: 20,
    translate: false,
  ),
)
```
For a full example, check [this](https://github.com/eyoeldefare/onboarding/tree/main/example/lib) out

### Creating your own custom indicators
If you want to paint, draw, render, etc your own indicator, you can easily do so using the `ShapePainter` class as shown bellow. You can also see the 4 default painters we've created [here](https://github.com/eyoeldefare/onboarding/blob/main/lib/src/paint.dart) to see how we created the indicators. Its super easy and allows you maximum customization.

Lets look at how we created the default `LinePainter` painter for example which is shown in one of the examples above:


``` dart
class MyCustomIndicatorPainter extends ShapePainter {
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
  beforeIndicatorsRender(Canvas canvas, Size size) {
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


//Now to use it inside your app, simply call it like a regular widget:
Indicator<MyCustomIndicatorPainter>(
  painter: MyCustomIndicatorPainter(
    currentPageIndex: currentIndex,
    pagesLength: pagesLength,
    netDragPercent: dragDistance,
    activePainter: activePainter,
    inactivePainter: inactivePainter,
    lineWidth: 20,
    translate: false,
  ),
)
```
<img loading="lazy" src="https://raw.githubusercontent.com/eyoeldefare/onboarding/main/images/example_9.gif" width=250>