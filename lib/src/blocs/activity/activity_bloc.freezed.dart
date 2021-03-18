// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'activity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ActivityLoadedTearOff {
  const _$ActivityLoadedTearOff();

// ignore: unused_element
  _ActivityLoaded call(
      {List<TransactionHistory> basicResponse,
      String searchtext = AppStrings.empty}) {
    return _ActivityLoaded(
      basicResponse: basicResponse,
      searchtext: searchtext,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ActivityLoaded = _$ActivityLoadedTearOff();

/// @nodoc
mixin _$ActivityLoaded {
  List<TransactionHistory> get basicResponse;
  String get searchtext;

  @JsonKey(ignore: true)
  $ActivityLoadedCopyWith<ActivityLoaded> get copyWith;
}

/// @nodoc
abstract class $ActivityLoadedCopyWith<$Res> {
  factory $ActivityLoadedCopyWith(
          ActivityLoaded value, $Res Function(ActivityLoaded) then) =
      _$ActivityLoadedCopyWithImpl<$Res>;
  $Res call({List<TransactionHistory> basicResponse, String searchtext});
}

/// @nodoc
class _$ActivityLoadedCopyWithImpl<$Res>
    implements $ActivityLoadedCopyWith<$Res> {
  _$ActivityLoadedCopyWithImpl(this._value, this._then);

  final ActivityLoaded _value;
  // ignore: unused_field
  final $Res Function(ActivityLoaded) _then;

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
abstract class _$ActivityLoadedCopyWith<$Res>
    implements $ActivityLoadedCopyWith<$Res> {
  factory _$ActivityLoadedCopyWith(
          _ActivityLoaded value, $Res Function(_ActivityLoaded) then) =
      __$ActivityLoadedCopyWithImpl<$Res>;
  @override
  $Res call({List<TransactionHistory> basicResponse, String searchtext});
}

/// @nodoc
class __$ActivityLoadedCopyWithImpl<$Res>
    extends _$ActivityLoadedCopyWithImpl<$Res>
    implements _$ActivityLoadedCopyWith<$Res> {
  __$ActivityLoadedCopyWithImpl(
      _ActivityLoaded _value, $Res Function(_ActivityLoaded) _then)
      : super(_value, (v) => _then(v as _ActivityLoaded));

  @override
  _ActivityLoaded get _value => super._value as _ActivityLoaded;

  @override
  $Res call({
    Object basicResponse = freezed,
    Object searchtext = freezed,
  }) {
    return _then(_ActivityLoaded(
      basicResponse: basicResponse == freezed
          ? _value.basicResponse
          : basicResponse as List<TransactionHistory>,
      searchtext:
          searchtext == freezed ? _value.searchtext : searchtext as String,
    ));
  }
}

/// @nodoc
class _$_ActivityLoaded
    with DiagnosticableTreeMixin
    implements _ActivityLoaded {
  _$_ActivityLoaded({this.basicResponse, this.searchtext = AppStrings.empty})
      : assert(searchtext != null);

  @override
  final List<TransactionHistory> basicResponse;
  @JsonKey(defaultValue: AppStrings.empty)
  @override
  final String searchtext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ActivityLoaded(basicResponse: $basicResponse, searchtext: $searchtext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ActivityLoaded'))
      ..add(DiagnosticsProperty('basicResponse', basicResponse))
      ..add(DiagnosticsProperty('searchtext', searchtext));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ActivityLoaded &&
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
  _$ActivityLoadedCopyWith<_ActivityLoaded> get copyWith =>
      __$ActivityLoadedCopyWithImpl<_ActivityLoaded>(this, _$identity);
}

abstract class _ActivityLoaded implements ActivityLoaded {
  factory _ActivityLoaded(
      {List<TransactionHistory> basicResponse,
      String searchtext}) = _$_ActivityLoaded;

  @override
  List<TransactionHistory> get basicResponse;
  @override
  String get searchtext;
  @override
  @JsonKey(ignore: true)
  _$ActivityLoadedCopyWith<_ActivityLoaded> get copyWith;
}
