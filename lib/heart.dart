import 'package:flutter/material.dart';

class HeartWidget extends LeafRenderObjectWidget {

  final Color color;

  HeartWidget({
    this.color = Colors.pinkAccent,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return HeartRenderObject(color: color);
  }

  @override
  void updateRenderObject(BuildContext context, HeartRenderObject renderObject) {
    renderObject.color = color;
  }

}

class HeartRenderObject extends RenderBox {

  Color? _color;

  HeartRenderObject({
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
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, paint);

    canvas.restore();
  }
}