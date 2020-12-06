import 'package:flutter/widgets.dart';

class PageModel {
  ///[assetPath] is the path of the image you have somewhere inside your project
  ///[title] is the title of the page you provide
  ///[info] is the info of the page you provide
  final String assetPath, title, info;

  PageModel({
    @required this.assetPath,
    @required this.title,
    @required this.info,
  })  : assert(assetPath != null),
        assert(title != null),
        assert(info != null);
}
