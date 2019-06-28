library timeline_node;

import 'package:flutter/material.dart';

enum TimelineNodeType { Left, Right }
enum TimelineNodePointType { None, Circle }
enum TimelineNodeLineType { None, Full, TopHalf, BottomHalf }

class TimelineNodeStyle {
  TimelineNodeType type;
  TimelineNodePointType pointType;
  Color pointColor;
  double pointRadius;
  TimelineNodeLineType lineType;
  Color lineColor;
  double lineWidth;
  double preferredWidth;

  TimelineNodeStyle(
      {this.type = TimelineNodeType.Left,
      this.pointType = TimelineNodePointType.None,
      this.pointColor = Colors.blue,
      this.pointRadius = 6,
      this.lineType = TimelineNodeLineType.None,
      this.lineColor = Colors.blue,
      this.lineWidth = 2,
      this.preferredWidth = 50});
}

class TimelineNode extends StatefulWidget {
  final TimelineNodeStyle style;
  final Widget child;

  TimelineNode({Key key, this.style, this.child}) : super(key: key);

  _TimelineNodeState createState() => _TimelineNodeState();
}

class _TimelineNodeState extends State<TimelineNode> {
  Widget layout() {
    switch (this.widget.style.type) {
      case TimelineNodeType.Left:
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                width: this.widget.style.preferredWidth,
                height: double.infinity,
                child: CustomPaint(
                  painter: TimelineNodeLinePainter(style: this.widget.style),
                ),
              ),
              Expanded(child: this.widget.child),
            ],
          ),
        );
        break;
      case TimelineNodeType.Right:
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(child: this.widget.child),
              Container(
                width: this.widget.style.preferredWidth,
                height: double.infinity,
                child: CustomPaint(
                  painter: TimelineNodeLinePainter(style: this.widget.style),
                ),
              ),
            ],
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Container(
            width: this.widget.style.preferredWidth,
            height: double.infinity,
            child: CustomPaint(
              painter: TimelineNodeLinePainter(style: this.widget.style),
            ),
          ),
          Expanded(child: this.widget.child),
        ],
      ),
    );
  }
}

class TimelineNodeLinePainter extends CustomPainter {
  TimelineNodeStyle style;

  TimelineNodeLinePainter({this.style});

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint();
    linePaint.color = this.style.lineColor;
    linePaint.strokeWidth = this.style.lineWidth;
    switch (this.style.lineType) {
      case TimelineNodeLineType.None:
        break;
      case TimelineNodeLineType.Full:
        canvas.drawLine(Offset(size.width / 2, 0),
            Offset(size.width / 2, size.height), linePaint);
        break;
      case TimelineNodeLineType.TopHalf:
        canvas.drawLine(Offset(size.width / 2, 0),
            Offset(size.width / 2, size.height / 2), linePaint);
        break;
      case TimelineNodeLineType.BottomHalf:
        canvas.drawLine(Offset(size.width / 2, size.height / 2),
            Offset(size.width / 2, size.height), linePaint);
        break;
    }

    Paint pointPaint = Paint();
    pointPaint.color = this.style.pointColor;

    switch (this.style.pointType) {
      case TimelineNodePointType.None:
        break;
      case TimelineNodePointType.Circle:
        canvas.drawCircle(Offset(size.width / 2, size.height / 2),
            this.style.pointRadius, pointPaint);
        break;
    }
  }

  @override
  bool shouldRepaint(TimelineNodeLinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TimelineNodeLinePainter oldDelegate) => false;
}
