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

  final GlobalKey _textAKey = GlobalKey();
  final GlobalKey _textBKey = GlobalKey();

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
          mainAxisSize: MainAxisSize.min,
          children: [
            AnchorWidget(
              child: Container(
                key: _textAKey,
                height: 100.0,
                width: 100.0,
                constraints: const BoxConstraints(
                  maxHeight: 100.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            AnchorWidget(
              child: Text(
                'Anchored Text',
                key: _textBKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnchorWidget extends StatelessWidget {

  Widget child;

  AnchorWidget({
    required this.child,
    Key? key,
  }): super(key: key) {
    assert(child.key != null);
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = child.key as GlobalKey?;
    RenderBox? renderBox =
    globalKey?.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) {
      return child;
    }

    final childHeight = renderBox.size.height;
    final childWidth = renderBox.size.width;

    const gap = 50.0;
    const arrowSize = 32.0;
    const offset = arrowSize/2;

    final stackHeight = childHeight + gap;
    final stackWidth = childWidth + gap;


    return SizedBox(
      height: stackHeight,
      width: stackWidth,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          child,
          const Positioned(
            // bottom of the original child
            bottom: (gap / 2) - offset,
            // right of the original child
            right: (gap / 2),
            child: SizedBox(
              height: 24.0,
              width: 24.0,
              child: Icon(
                Icons.arrow_upward,
                size: arrowSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

}