import 'package:intelligence/model/representable.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'intelligence_method_channel.dart';

abstract class IntelligencePlatform extends PlatformInterface {
  /// Constructs a IntelligencePlatform.
  IntelligencePlatform() : super(token: _token);

  static final Object _token = Object();

  static IntelligencePlatform _instance = MethodChannelIntelligence();

  /// The default instance of [IntelligencePlatform] to use.
  ///
  /// Defaults to [MethodChannelIntelligence].
  static IntelligencePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IntelligencePlatform] when
  /// they register themselves.
  static set instance(IntelligencePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> populate(List<Representable> items) {
    throw UnimplementedError(
      'populateIntelligence() has not been implemented.',
    );
  }

  Stream<String> selectionsStream() {
    throw UnimplementedError('selectedStream() has not been implemented.');
  }
}
