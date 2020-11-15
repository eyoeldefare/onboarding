import 'package:flutter/material.dart';

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
  final ActiveIndicator activeIndicator;
  final ClosedIndicator closedIndicator;
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
  final DesignType polygon;
  final double polygonRadius;
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
  final DesignType lineType;
  final double lineWidth;
  final double lineSpacer;
  const LineDesign(
      {@required this.lineType, this.lineWidth = 19.0, this.lineSpacer = 35.0})
      : assert(lineType != null),
        assert(
            lineType == DesignType.line_nonuniform ||
                lineType == DesignType.line_uniform,
            "lineType can only be either DesignType.uniform_line or DesignType.line");
}
