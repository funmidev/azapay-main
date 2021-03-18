// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'activity_isolate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ActivityLoadedIsolateTearOff {
  const _$ActivityLoadedIsolateTearOff();

// ignore: unused_element
  _ActivityLoadedIsolate call(
      {List<TransactionHistory> basicResponse,
      String searchtext = AppStrings.empty}) {
    return _ActivityLoadedIsolate(
      basicResponse: basicResponse,
      searchtext: searchtext,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ActivityLoadedIsolate = _$ActivityLoadedIsolateTearOff();

/// @nodoc
mixin _$ActivityLoadedIsolate {
  List<TransactionHistory> get basicResponse;
  String get searchtext;

  @JsonKey(ignore: true)
  $ActivityLoadedIsolateCopyWith<ActivityLoadedIsolate> get copyWith;
}

/// @nodoc
abstract class $ActivityLoadedIsolateCopyWith<$Res> {
  factory $ActivityLoadedIsolateCopyWith(ActivityLoadedIsolate value,
          $Res Function(ActivityLoadedIsolate) then) =
      _$ActivityLoadedIsolateCopyWithImpl<$Res>;
  $Res call({List<TransactionHistory> basicResponse, String searchtext});
}

/// @nodoc
class _$ActivityLoadedIsolateCopyWithImpl<$Res>
    implements $ActivityLoadedIsolateCopyWith<$Res> {
  _$ActivityLoadedIsolateCopyWithImpl(this._value, this._then);

  final ActivityLoadedIsolate _value;
  // ignore: unused_field
  final $Res Function(ActivityLoadedIsolate) _then;

  @override
  $Res call({
    Object basicResponse = freezed,
    Object searchtext = freezed,
  }) {
    return _then(_value.copyWith(
      basicResponse: basicResponse == freezed
          ? _value.basicResponse
          : basicResponse as List<TransactionHistory>,
      searchtext:
          searchtext == freezed ? _value.searchtext : searchtext as String,
    ));
  }
}

/// @nodoc
abstract class _$ActivityLoadedIsolateCopyWith<$Res>
    implements $ActivityLoadedIsolateCopyWith<$Res> {
  factory _$ActivityLoadedIsolateCopyWith(_ActivityLoadedIsolate value,
          $Res Function(_ActivityLoadedIsolate) then) =
      __$ActivityLoadedIsolateCopyWithImpl<$Res>;
  @override
  $Res call({List<TransactionHistory> basicResponse, String searchtext});
}

/// @nodoc
class __$ActivityLoadedIsolateCopyWithImpl<$Res>
    extends _$ActivityLoadedIsolateCopyWithImpl<$Res>
    implements _$ActivityLoadedIsolateCopyWith<$Res> {
  __$ActivityLoadedIsolateCopyWithImpl(_ActivityLoadedIsolate _value,
      $Res Function(_ActivityLoadedIsolate) _then)
      : super(_value, (v) => _then(v as _ActivityLoadedIsolate));

  @override
  _ActivityLoadedIsolate get _value => super._value as _ActivityLoadedIsolate;

  @override
  $Res call({
    Object basicResponse = freezed,
    Object searchtext = freezed,
  }) {
    return _then(_ActivityLoadedIsolate(
      basicResponse: basicResponse == freezed
          ? _value.basicResponse
          : basicResponse as List<TransactionHistory>,
      searchtext:
          searchtext == freezed ? _value.searchtext : searchtext as String,
    ));
  }
}

/// @nodoc
class _$_ActivityLoadedIsolate
    with DiagnosticableTreeMixin
    implements _ActivityLoadedIsolate {
  _$_ActivityLoadedIsolate(
      {this.basicResponse, this.searchtext = AppStrings.empty})
      : assert(searchtext != null);

  @override
  final List<TransactionHistory> basicResponse;
  @JsonKey(defaultValue: AppStrings.empty)
  @override
  final String searchtext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ActivityLoadedIsolate(basicResponse: $basicResponse, searchtext: $searchtext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ActivityLoadedIsolate'))
      ..add(DiagnosticsProperty('basicResponse', basicResponse))
      ..add(DiagnosticsProperty('searchtext', searchtext));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ActivityLoadedIsolate &&
            (identical(other.basicResponse, basicResponse) ||
                const DeepCollectionEquality()
                    .equals(other.basicResponse, basicResponse)) &&
            (identical(other.searchtext, searchtext) ||
                const DeepCollectionEquality()
                    .equals(other.searchtext, searchtext)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(basicResponse) ^
      const DeepCollectionEquality().hash(searchtext);

  @JsonKey(ignore: true)
  @override
  _$ActivityLoadedIsolateCopyWith<_ActivityLoadedIsolate> get copyWith =>
      __$ActivityLoadedIsolateCopyWithImpl<_ActivityLoadedIsolate>(
          this, _$identity);
}

abstract class _ActivityLoadedIsolate implements ActivityLoadedIsolate {
  factory _ActivityLoadedIsolate(
      {List<TransactionHistory> basicResponse,
      String searchtext}) = _$_ActivityLoadedIsolate;

  @override
  List<TransactionHistory> get basicResponse;
  @override
  String get searchtext;
  @override
  @JsonKey(ignore: true)
  _$ActivityLoadedIsolateCopyWith<_ActivityLoadedIsolate> get copyWith;
}
