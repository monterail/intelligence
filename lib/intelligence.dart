import 'package:intelligence/model/representable.dart';

import 'intelligence_platform_interface.dart';

class Intelligence {
  Future<void> populate(List<Representable> items) =>
      IntelligencePlatform.instance.populate(items);

  Stream<String> selectionsStream() =>
      IntelligencePlatform.instance.selectionsStream();
}
