import 'package:flutter/material.dart';

///This contains [7] different kinds of indicator designs you can choose from including [polygon_diamond, polygon_arrow, polygon_pentagon, polygon_square, polygon_circle, line_uniform, line_nonuniform]
enum DesignType {
  polygon_diamond,
  polygon_arrow,
  polygon_pentagon,
  polygon_square,
  polygon_circle,
  line_uniform,
  line_nonuniform,
}

class Indicator {
  ///Add a design for the active indicator style. The active indicator is when the index is on the current page. The default is [const ActiveIndicator(color: Colors.grey, borderWidth: 0.7)]
  final ActiveIndicator activeIndicator;

  ///Add a design for the close indicator style. The close indicator is when the index is not on the current page. The default is [const ClosedIndicator(color: Colors.grey, borderWidth: 0.7)]
  final ClosedIndicator closedIndicator;

  ///Add an indicator design. This can not be [null] and is [required]
  final IndicatorDesign indicatorDesign;

  Indicator({
    @required this.indicatorDesign,
    this.activeIndicator =
        const ActiveIndicator(color: Colors.grey, borderWidth: 0.7),
    this.closedIndicator =
        const ClosedIndicator(color: Colors.white, borderWidth: 0.7),
  }) : assert(indicatorDesign != null);
}

class ActiveIndicator {
  final Color color;
  final double borderWidth;

  const ActiveIndicator({this.color = Colors.white, this.borderWidth = 0.7});
}

class ClosedIndicator {
  final Color color;
  final double borderWidth;

  const ClosedIndicator({this.color = Colors.grey, this.borderWidth = 0.7});
}

///You can choose between a polygon or a straight line for your design choice of your indicator
class IndicatorDesign {
  final PolygonDesign _polygonDesign;
  final LineDesign _lineDesign;

  PolygonDesign get polygonDesign => _polygonDesign;

  LineDesign get lineDesign => _lineDesign;

  //Constructor
  const IndicatorDesign.polygon({PolygonDesign polygonDesign})
      : assert(polygonDesign != null),
        this._polygonDesign = polygonDesign,
        this._lineDesign = null;

  const IndicatorDesign.line({LineDesign lineDesign})
      : assert(lineDesign != null),
        this._polygonDesign = null,
        this._lineDesign = lineDesign;
}

class PolygonDesign {
  ///Add a polygon design type. This should not be [null]. This must be one of these [DesignType.polygon_diamond, DesignType.polygon_arrow, DesignType.polygon_pentagon, DesignType.polygon_square, DesignType.polygon_circle]
  final DesignType polygon;

  ///Add a radius for the polygons you've choosed. The default is [polygonRadius = 7.0]
  final double polygonRadius;

  ///Add the space between the polygons you've choosed. The default is [polygonSpacer = 21.0]
  final double polygonSpacer;

  const PolygonDesign({
    @required this.polygon,
    this.polygonRadius = 7.0,
    this.polygonSpacer = 21.0,
  })  : assert(polygon != null),
        assert(
            polygon != DesignType.line_nonuniform ||
                polygon != DesignType.line_uniform,
            "polygon can not be 'DesignType.line' or 'DesignType.uniform_line'");
}

class LineDesign {
  ///Add the type of the line. This must not be [null]. This needs to be [DesignType.line_nonuniform] or [DesignType.line_uniform]
  final DesignType lineType;

  ///Add a width for the indicator lines. The default is [lineWidth = 19.0]
  final double lineWidth;

  ///Add a space between the indicator lines. The default is [lineSpacer = 35.0]
  final double lineSpacer;

  const LineDesign(
      {@required this.lineType, this.lineWidth = 19.0, this.lineSpacer = 35.0})
      : assert(lineType != null),
        assert(
            lineType == DesignType.line_nonuniform ||
                lineType == DesignType.line_uniform,
            "lineType can only be either DesignType.uniform_line or DesignType.line");
}
