import 'package:flutter/material.dart';
import 'package:render_object/circle.dart';
import 'package:render_object/half_triangle.dart';
import 'package:render_object/heart.dart';
import 'package:render_object/square.dart';
import 'package:render_object/triangle.dart';

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
                color: _clicked ? Colors.blue : Colors.pinkAccent,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            // SizedBox(
            //   height: 80.0,
            //   width: 80.0,
            //   child: TriangleWidget(
            //     color: _clicked ? Colors.blue : Colors.pinkAccent,
            //   ),
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // SizedBox(
            //   height: 80.0,
            //   width: 80.0,
            //   child: HalfTriangleWidget(
            //     color: _clicked ? Colors.blue : Colors.pinkAccent,
            //   ),
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            // SizedBox(
            //   height: 80.0,
            //   width: 80.0,
            //   child: SquareWidget(
            //     color: _clicked ? Colors.blue : Colors.pinkAccent,
            //   ),
            // ),
            // const SizedBox(
            //   height: 64.0,
            // ),
            // SizedBox(
            //   height: 80.0,
            //   width: 80.0,
            //   child: CircleWidget(
            //     color: _clicked ? Colors.blue : Colors.pinkAccent,
            //   ),
            // ),
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