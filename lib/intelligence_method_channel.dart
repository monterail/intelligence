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
  final eventChannel = const EventChannel('intelligence');

  @override
  Future<void> populateIntelligence(List<Representable> items) async {
    await methodChannel.invokeMethod<bool>(
      'populate',
      items.toJson(),
    );
  }

  @override
  Stream<Representable> selectedStream() =>
      eventChannel.receiveBroadcastStream().map(
            (representableJson) => Representable.fromJson(representableJson),
          );
}

extension on List<Representable> {
  String toJson() {
    final jsonItems = map((item) => jsonEncode(item.toJson())).toList();
    return '{"items": [${jsonItems.join(',')}]}';
  }
}
