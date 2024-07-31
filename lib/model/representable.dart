import 'package:freezed_annotation/freezed_annotation.dart';

part 'representable.freezed.dart';
part 'representable.g.dart';

@freezed
class Representable with _$Representable {
  const factory Representable({
    required String representation,
    required String id,
  }) = _Representable;

  factory Representable.fromJson(Map<String, Object?> json) =>
      _$RepresentableFromJson(json);
}
