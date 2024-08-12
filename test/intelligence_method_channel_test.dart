import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intelligence/intelligence_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelIntelligence platform = MethodChannelIntelligence();
  const MethodChannel channel = MethodChannel('intelligence');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.populate(), '42');
  });
}
