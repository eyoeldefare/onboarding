# onboarding

Onboarding is a sample flutter onboarding plugin you can use to attract first-time users when they land on your page, hence the name onboarding. The widget gives you a header and footer builder along side your swipe-able widget. The widget also gives you a painter base class you can extend to build your own custom indicators.

## Environment

`sdk: ">=2.12.0 <3.0.0"`

`flutter: ">=1.17.0"`

## Getting Started

To get started using this widget, you will need to first import the package inside your project following the installation guide found on [peb.dev/packages/onboarding](https://pub.dev/packages/onboarding).

```yaml 
  dependencies:
    onboarding: ^3.2.0+
```
`$ flutter pub get`

## Usage
To use this widget, 
1. `import 'package:onboarding/onboarding.dart'; ` inside your dart file
2. Follow the [`examples here`](https://github.com/eyoeldefare/onboarding/blob/main/example/lib/main.dart)
```dart 
Onboarding(
  swipeableBody: ..., //[List<Widget>] - List of swipeable widgets 
  startIndex: ..., //[int] - the starting index of the swipeable widgets
  onPageChanges:(netDragDistance,pagesLength,currentIndex){
    //1) [pagesLength] The drage distance from swipping
    //2) [pagesLength] The length of the swipeable widgets
    //3) [currentIndex] The currect index 
  },
  buildHeader:(context, netDragDistance, pagesLength, currentIndex, setIndex){
    //Same as onPageChanges but with [setIndex] which allows u to change the index from this function
  },
  buildFooter:(context, netDragDistance, pagesLength, currentIndex, setIndex){
  //Same as buildHeader
  },
  animationInMilliseconds: ..., //[int] - the speed of animation in ms
)
``` 

## Examples With Different Indicator Painters
Understand that this widget uses the custom painter class to render the indicator used to show the progress of the pages swiped. As such, we've designed this widget to enable you to access `CustomerPainter`'s functionalities throw our `ShapePainter` class to be able to draw your own custom painters for the indicators to show. By default, this widget comes with 4 simple painters that draw commonly used shapes to show the progress of the indicator. The 4 painters' class names are `LinePainter`, `CirclePainter`, `SquarePainter`, and `TrianglePainter`. 

### Examples with default painters
These UI examples bellow are using the default painters that come with this widget. You can always create your own Painter by extending the `ShapePainter` class to draw or paint anything to be your indicator.

<img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main1.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main2.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main2.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main2.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main2.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main2.gif" width=250> <img src="https://raw.githubusercontent.com/eyoeldefare/onboarding/breaking/images/main2.gif" width=250>

#### Here are the four indicators that are used in the example above

[See Full Example](https://github.com/eyoeldefare/onboarding/tree/main/example)

1. Line indicator
``` dart 
Indicator<LinePainter>(
  painter: LinePainter(
    currentPageIndex: currentIndex,
    pagesLength: pagesLength,
    netDragPercent: dragDistance,
    activePainter: activePainter,
    inactivePainter: inactivePainter,
    lineWidth: 20,
  ),
)
```
2. Triangle indicator
``` dart 
Indicator<TrianglePainter>(
  painter: TrianglePainter(
    currentPageIndex: currentIndex,
    pagesLength: pagesLength,
    netDragPercent: dragDistance,
    activePainter: activePainter,
    inactivePainter: inactivePainter,
    showAllActiveIndicators: false, //can set it to true to see all active indicator effect
  ),
)
```
3. Circle indicator
``` dart 
Indicator<CirclePainter>(
  painter: CirclePainter(
    currentPageIndex: currentIndex,
    pagesLength: pagesLength,
    netDragPercent: dragDistance,
    activePainter: activePainter,
    inactivePainter: inactivePainter,
    radius: 5.0,
    space: 10.0,
    showAllActiveIndicators: false,
  ),
)
```
4. Square indicator
``` dart 
Indicator<SquarePainter>(
  painter: SquarePainter(
    currentPageIndex: index,
    pagesLength: pagesLength,
    netDragPercent: dragDistance,
    activePainter: activePainter,
    inactivePainter: inactivePainter,
    space: 5,
    width: 10,
    showAllActiveIndicators: false,
  ),
)
```
### Creating your own custom painter 
If you want to paint, draw, render, etc your own indicator, you can easily do so using the `ShapePainter` class as shown bellow. You can also see the 4 default painters we've created [here](https://github.com/eyoeldefare/onboarding/wiki/_new) to see how we create the indicators. Its super easy and allows you maximum customization.

Lets look at how we created the default `LinePainter` painter for example which is shown in one of the example UIs above:

```dart
class LinePainter extends ShapePainter{
  final double lineWidth = 20; //how wide you want the line to be?
  //You will need to override the method [paintActiveIndicators] to paint your own active indicators
  @override
  paintActiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    //The [netDragPercent] is how far you're swiped the page
    //The code bellow will repaint the indicators everytime some variables changes - such as [netDragPercent]
    final activeOffset1 = Offset(netDragPercent * lineWidth * pagesLength, 0.0);
    final activeOffset2 = Offset(activeOffset1.dx + lineWidth, 0.0);
    canvas.drawLine(activeOffset1, activeOffset2, paint);
  }

  //This is paint the indicators that are not active.
  @override
  paintInactiveIndicators(Canvas canvas, Size size, Paint paint, Path path) {
    final inActiveOffset = Offset(lineWidth * pagesLength, 0.0);
    canvas.drawLine(Offset.zero, inActiveOffset, paint);
  }
}
```