import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intelligence/model/representable.dart';

import 'intelligence_platform_interface.dart';

/// An implementation of [IntelligencePlatform] that uses method channels.
class MethodChannelIntelligence extends IntelligencePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('intelligence');

  @visibleForTesting
  final linksChannel = const EventChannel('intelligence/links');

  @override
  Future<void> populate(List<Representable> items) async {
    await methodChannel.invokeMethod<bool>(
      'populate',
      items.toJson(),
    );
  }

  @override
  Stream<String> selectionsStream() =>
      linksChannel.receiveBroadcastStream().map((item) => item.toString());
}

extension on List<Representable> {
  String toJson() {
    final jsonItems = map((item) => jsonEncode(item.toJson())).toList();
    return '{"items": [${jsonItems.join(',')}]}';
  }
}
