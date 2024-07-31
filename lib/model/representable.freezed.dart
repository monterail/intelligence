// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'representable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Representable _$RepresentableFromJson(Map<String, dynamic> json) {
  return _Representable.fromJson(json);
}

/// @nodoc
mixin _$Representable {
  String get representation => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepresentableCopyWith<Representable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepresentableCopyWith<$Res> {
  factory $RepresentableCopyWith(
          Representable value, $Res Function(Representable) then) =
      _$RepresentableCopyWithImpl<$Res, Representable>;
  @useResult
  $Res call({String representation, String id});
}

/// @nodoc
class _$RepresentableCopyWithImpl<$Res, $Val extends Representable>
    implements $RepresentableCopyWith<$Res> {
  _$RepresentableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representation = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      representation: null == representation
          ? _value.representation
          : representation // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepresentableImplCopyWith<$Res>
    implements $RepresentableCopyWith<$Res> {
  factory _$$RepresentableImplCopyWith(
          _$RepresentableImpl value, $Res Function(_$RepresentableImpl) then) =
      __$$RepresentableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String representation, String id});
}

/// @nodoc
class __$$RepresentableImplCopyWithImpl<$Res>
    extends _$RepresentableCopyWithImpl<$Res, _$RepresentableImpl>
    implements _$$RepresentableImplCopyWith<$Res> {
  __$$RepresentableImplCopyWithImpl(
      _$RepresentableImpl _value, $Res Function(_$RepresentableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? representation = null,
    Object? id = null,
  }) {
    return _then(_$RepresentableImpl(
      representation: null == representation
          ? _value.representation
          : representation // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepresentableImpl implements _Representable {
  const _$RepresentableImpl({required this.representation, required this.id});

  factory _$RepresentableImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepresentableImplFromJson(json);

  @override
  final String representation;
  @override
  final String id;

  @override
  String toString() {
    return 'Representable(representation: $representation, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepresentableImpl &&
            (identical(other.representation, representation) ||
                other.representation == representation) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, representation, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepresentableImplCopyWith<_$RepresentableImpl> get copyWith =>
      __$$RepresentableImplCopyWithImpl<_$RepresentableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepresentableImplToJson(
      this,
    );
  }
}

abstract class _Representable implements Representable {
  const factory _Representable(
      {required final String representation,
      required final String id}) = _$RepresentableImpl;

  factory _Representable.fromJson(Map<String, dynamic> json) =
      _$RepresentableImpl.fromJson;

  @override
  String get representation;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$RepresentableImplCopyWith<_$RepresentableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
