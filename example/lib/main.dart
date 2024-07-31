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

  @override
  void initState() {
    super.initState();
    unawaited(init());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> init() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      await _intelligencePlugin.populateIntelligence(const [
        Representable(representation: 'John Doe', id: 'ABC1'),
      ]);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Placeholder(),
      ),
    );
  }
}
