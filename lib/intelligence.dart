import 'package:intelligence/model/representable.dart';

import 'intelligence_platform_interface.dart';

/// Facilitates communication between your Dart and native layers.
class Intelligence {
  /// Informs the OS about entities available in your application.
  Future<void> populate(List<Representable> items) =>
      IntelligencePlatform.instance.populate(items);

  /// Feeds back the id's of entities selected by the user
  /// in OS flows to the Dart layer.
  Stream<String> selectionsStream() =>
      IntelligencePlatform.instance.selectionsStream();
}
