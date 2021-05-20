import 'package:flutter/widgets.dart';

class PageModel {
  ///[assetPath] is the path of the image you have somewhere inside your project
  ///[title] is the title of the page you provide
  ///[info] is the info of the page you provide
  final Text title, info;
  final Image image;

  PageModel({
    @required this.image,
    @required this.title,
    @required this.info,
  })  : assert(image != null),
        assert(title != null),
        assert(info != null);
}
