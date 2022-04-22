import 'package:flutter/material.dart';

class SquareWidget extends LeafRenderObjectWidget {

  final Color color;

  SquareWidget({
    this.color = Colors.pinkAccent,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return SquareRenderObject(color: color);
  }

  @override
  void updateRenderObject(BuildContext context, SquareRenderObject renderObject) {
    renderObject.color = color;
  }

}

class SquareRenderObject extends RenderBox {

  Color? _color;

  SquareRenderObject({
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

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, paint);

    canvas.restore();
  }
}