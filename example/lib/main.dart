import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:intelligence/intelligence.dart';
import 'package:intelligence/model/representable.dart';

void main() {
  runApp(const CupertinoApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _intelligencePlugin = Intelligence();
  final _receivedItems = [];

  @override
  void initState() {
    super.initState();
    unawaited(init());
  }

  Future<void> init() async {
    try {
      await _intelligencePlugin.populate(const [
        Representable(representation: 'Heart', id: 'heart'),
        Representable(representation: 'Circle', id: 'circle'),
        Representable(representation: 'Rectangle', id: 'rectangle'),
        Representable(representation: 'Triangle', id: 'triangle'),
      ]);
      _intelligencePlugin.selectionsStream().listen(_handleSelection);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handleSelection(String id) {
    setState(() {
      _receivedItems.add(id);
    });
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => DrawPage(shape: Shape.fromString(id)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            leading: Icon(CupertinoIcons.captions_bubble_fill),
            largeTitle: Text('Intelligence demo'),
          ),
          SliverList.builder(
            itemBuilder: (_, index) =>
                CupertinoListTile(title: Text(_receivedItems[index])),
            itemCount: _receivedItems.length,
          ),
        ],
      ),
    );
  }
}

enum Shape {
  heart('assets/heart.svg'),
  circle('assets/circle.svg'),
  rectangle('assets/rectangle.svg'),
  triangle('assets/triangle.svg');

  const Shape(this.asset);
  final String asset;

  static Shape fromString(String value) => switch (value) {
        'circle' => Shape.circle,
        'rectangle' => Shape.rectangle,
        'triangle' => Shape.triangle,
        _ => Shape.heart,
      };
}

class DrawPage extends StatelessWidget {
  const DrawPage({super.key, required this.shape});

  final Shape shape;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: AnimatedDrawing.svg(
            shape.asset,
            animationCurve: Curves.fastLinearToSlowEaseIn,
            run: true,
            duration: const Duration(seconds: 3),
          ),
        ),
      ),
    );
  }
}
