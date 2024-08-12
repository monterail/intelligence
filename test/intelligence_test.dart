import 'package:flutter_test/flutter_test.dart';
import 'package:intelligence/intelligence.dart';
import 'package:intelligence/intelligence_platform_interface.dart';
import 'package:intelligence/intelligence_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIntelligencePlatform
    with MockPlatformInterfaceMixin
    implements IntelligencePlatform {
  @override
  Future<String?> populate() => Future.value('42');
}

void main() {
  final IntelligencePlatform initialPlatform = IntelligencePlatform.instance;

  test('$MethodChannelIntelligence is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIntelligence>());
  });

  test('getPlatformVersion', () async {
    Intelligence intelligencePlugin = Intelligence();
    MockIntelligencePlatform fakePlatform = MockIntelligencePlatform();
    IntelligencePlatform.instance = fakePlatform;

    expect(await intelligencePlugin.getPlatformVersion(), '42');
  });
}
