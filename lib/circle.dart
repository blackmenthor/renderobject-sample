import 'dart:math';

import 'package:flutter/material.dart';

class CircleWidget extends LeafRenderObjectWidget {

  final Color color;

  CircleWidget({
    this.color = Colors.pinkAccent,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return CircleRenderObject(color: color);
  }

  @override
  void updateRenderObject(BuildContext context, CircleRenderObject renderObject) {
    renderObject.color = color;
  }

}

class CircleRenderObject extends RenderBox {

  Color? _color;

  CircleRenderObject({
    Color color = Colors.pinkAccent,
  }) {
    _color = color;
  }

  Color? get color => _color;

  set color(Color? value) {
    if (value == _color) {
      return;
    }
    _color = value;
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return Size(constraints.hasBoundedWidth ? constraints.maxWidth : 0,
        constraints.hasBoundedHeight ? constraints.maxHeight : 0);
  }

  @override
  bool get sizedByParent => true;

  @override
  bool get isRepaintBoundary => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final paint = Paint()
      ..color = color!
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    double width = size.width;
    double height = size.height;

    canvas.save();

    Offset center = Offset(width * 0.5, height * 0.5);

    canvas.drawCircle(center, width, paint);
    canvas.restore();
  }
}