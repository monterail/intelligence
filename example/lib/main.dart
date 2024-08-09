import 'package:flutter/cupertino.dart';
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
        Representable(representation: 'Grape', id: 'grp'),
        Representable(representation: 'Orange', id: 'org'),
        Representable(representation: 'Pear', id: 'per'),
        Representable(representation: 'Strawberry', id: 'sbr'),
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
    return CupertinoApp(
      home: CupertinoPageScaffold(
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
            )
          ],
        ),
      ),
    );
  }
}
