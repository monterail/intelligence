import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:intelligence/intelligence.dart';
import 'package:intelligence/model/representable.dart';

void main() {
  runApp(const MyApp());
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
      await _intelligencePlugin.populateIntelligence(const [
        Representable(representation: 'John Doe', id: 'ABC1'),
      ]);
      _intelligencePlugin.selectedStream().listen((item) {
        setState(() {
          _receivedItems.add(item);
        });
      });
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Intelligence example app'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _receivedItems.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(_receivedItems[index]),
            ),
          ),
        ),
      ),
    );
  }
}
