import 'dart:math' as math;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: CustomPaint(
            painter: FlutterPainter(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FlutterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _paintLine(canvas, size);

    // _paintCircle(canvas, size);

    _paintEyes(canvas, size);

    _paintSmile(canvas, size);
  }

  void _paintLine(Canvas canvas, Size size) {
    final painterLine = Paint()
      ..color = Colors.lightGreenAccent
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final start = size.width * 0.25;
    final end = size.width * 0.75;

    final centerHeight = size.height * 0.25;

    final startOffset = Offset(start, centerHeight);
    final endOffset = Offset(end, centerHeight);

    canvas.drawLine(startOffset, endOffset, painterLine);
  }

  void _paintCircle(Canvas canvas, Size size) {
    final painterCircle = Paint()
      ..color = Colors.lightGreenAccent
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final centerHeight = size.height * 0.25;
    final centerWidth = size.width * 0.5;

    final centerOffset = Offset(centerWidth, centerHeight);

    canvas.drawCircle(centerOffset, 50.0, painterCircle);
  }

  void _paintEyes(Canvas canvas, Size size) {
    final painterCircle = Paint()
      ..color = Colors.lightGreenAccent
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final centerHeight = size.height * 0.45;
    final centerWidthLeft = size.width * 0.40;

    final centerOffsetLeft = Offset(centerWidthLeft, centerHeight);

    canvas.drawCircle(centerOffsetLeft, 10.0, painterCircle);

    final centerWidthRight = size.width * 0.60;

    final centerOffsetRight = Offset(centerWidthRight, centerHeight);

    canvas.drawCircle(centerOffsetRight, 10.0, painterCircle);
  }

  void _paintSmile(Canvas canvas, Size size) {
    final painterSmile = Paint()
      ..color = Colors.lightGreenAccent
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final rect = Rect.fromLTRB(60, 200, 240, 300);
    final startAngle = 0.0;
    final sweepAngle = math.pi;
    final useCenter = false;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, painterSmile);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
