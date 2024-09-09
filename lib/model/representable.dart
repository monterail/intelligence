import 'package:freezed_annotation/freezed_annotation.dart';

part 'representable.freezed.dart';
part 'representable.g.dart';

@freezed

/// Boiled down entity data that will be exposed to the
/// user in OS UI.
///
/// [Representable.representation] is a string that will be presented
/// to the user in the OS flows.
///
/// [Representable.id] is an identifier that should let your app
/// domain to distinguish between different [Representable] entities.
class Representable with _$Representable {
  const factory Representable({
    required String representation,
    required String id,
  }) = _Representable;

  factory Representable.fromJson(Map<String, Object?> json) =>
      _$RepresentableFromJson(json);
}
