import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.0,
              width: 70.0,
              child: HeartWidget(
                heartColor: _clicked ? Colors.blue : Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _clicked = !_clicked;
          });
        },
      ),
    );
  }
}

class HeartWidget extends LeafRenderObjectWidget {

  final Color heartColor;

  HeartWidget({
      this.heartColor = Colors.pinkAccent,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return HeartRenderObject(heartColor: heartColor);
  }

  @override
  void updateRenderObject(BuildContext context, HeartRenderObject renderObject) {
    renderObject.heartColor = heartColor;
  }

}

class HeartRenderObject extends RenderBox {

  Color? _heartColor;

  HeartRenderObject({
    Color heartColor = Colors.pinkAccent,
  }) {
    _heartColor = heartColor;
  }

  Color? get heartColor => _heartColor;

  set heartColor(Color? value) {
    if (value == _heartColor) {
      return;
    }
    _heartColor = value;
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
      ..color = heartColor!
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