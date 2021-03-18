// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationLoadedTearOff {
  const _$NotificationLoadedTearOff();

// ignore: unused_element
  _NotificationLoaded call(
      {int success = 100,
      int error = 100,
      String responsemessage,
      Fund fundrequest = const Fund(),
      List<RefFund> refFund,
      List<Fund> fundrequestlist = const []}) {
    return _NotificationLoaded(
      success: success,
      error: error,
      responsemessage: responsemessage,
      fundrequest: fundrequest,
      refFund: refFund,
      fundrequestlist: fundrequestlist,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationLoaded = _$NotificationLoadedTearOff();

/// @nodoc
mixin _$NotificationLoaded {
  int get success;
  int get error;
  String get responsemessage;
  Fund get fundrequest;
  List<RefFund> get refFund;
  List<Fund> get fundrequestlist;

  @JsonKey(ignore: true)
  $NotificationLoadedCopyWith<NotificationLoaded> get copyWith;
}

/// @nodoc
abstract class $NotificationLoadedCopyWith<$Res> {
  factory $NotificationLoadedCopyWith(
          NotificationLoaded value, $Res Function(NotificationLoaded) then) =
      _$NotificationLoadedCopyWithImpl<$Res>;
  $Res call(
      {int success,
      int error,
      String responsemessage,
      Fund fundrequest,
      List<RefFund> refFund,
      List<Fund> fundrequestlist});
}

/// @nodoc
class _$NotificationLoadedCopyWithImpl<$Res>
    implements $NotificationLoadedCopyWith<$Res> {
  _$NotificationLoadedCopyWithImpl(this._value, this._then);

  final NotificationLoaded _value;
  // ignore: unused_field
  final $Res Function(NotificationLoaded) _then;

  @override
  $Res call({
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
    Object fundrequest = freezed,
    Object refFund = freezed,
    Object fundrequestlist = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
      fundrequest:
          fundrequest == freezed ? _value.fundrequest : fundrequest as Fund,
      refFund: refFund == freezed ? _value.refFund : refFund as List<RefFund>,
      fundrequestlist: fundrequestlist == freezed
          ? _value.fundrequestlist
          : fundrequestlist as List<Fund>,
    ));
  }
}

/// @nodoc
abstract class _$NotificationLoadedCopyWith<$Res>
    implements $NotificationLoadedCopyWith<$Res> {
  factory _$NotificationLoadedCopyWith(
          _NotificationLoaded value, $Res Function(_NotificationLoaded) then) =
      __$NotificationLoadedCopyWithImpl<$Res>;
  @override
  $Res call(
      {int success,
      int error,
      String responsemessage,
      Fund fundrequest,
      List<RefFund> refFund,
      List<Fund> fundrequestlist});
}

/// @nodoc
class __$NotificationLoadedCopyWithImpl<$Res>
    extends _$NotificationLoadedCopyWithImpl<$Res>
    implements _$NotificationLoadedCopyWith<$Res> {
  __$NotificationLoadedCopyWithImpl(
      _NotificationLoaded _value, $Res Function(_NotificationLoaded) _then)
      : super(_value, (v) => _then(v as _NotificationLoaded));

  @override
  _NotificationLoaded get _value => super._value as _NotificationLoaded;

  @override
  $Res call({
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
    Object fundrequest = freezed,
    Object refFund = freezed,
    Object fundrequestlist = freezed,
  }) {
    return _then(_NotificationLoaded(
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
      fundrequest:
          fundrequest == freezed ? _value.fundrequest : fundrequest as Fund,
      refFund: refFund == freezed ? _value.refFund : refFund as List<RefFund>,
      fundrequestlist: fundrequestlist == freezed
          ? _value.fundrequestlist
          : fundrequestlist as List<Fund>,
    ));
  }
}

/// @nodoc
class _$_NotificationLoaded
    with DiagnosticableTreeMixin
    implements _NotificationLoaded {
  _$_NotificationLoaded(
      {this.success = 100,
      this.error = 100,
      this.responsemessage,
      this.fundrequest = const Fund(),
      this.refFund,
      this.fundrequestlist = const []})
      : assert(success != null),
        assert(error != null),
        assert(fundrequest != null),
        assert(fundrequestlist != null);

  @JsonKey(defaultValue: 100)
  @override
  final int success;
  @JsonKey(defaultValue: 100)
  @override
  final int error;
  @override
  final String responsemessage;
  @JsonKey(defaultValue: const Fund())
  @override
  final Fund fundrequest;
  @override
  final List<RefFund> refFund;
  @JsonKey(defaultValue: const [])
  @override
  final List<Fund> fundrequestlist;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationLoaded(success: $success, error: $error, responsemessage: $responsemessage, fundrequest: $fundrequest, refFund: $refFund, fundrequestlist: $fundrequestlist)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationLoaded'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('responsemessage', responsemessage))
      ..add(DiagnosticsProperty('fundrequest', fundrequest))
      ..add(DiagnosticsProperty('refFund', refFund))
      ..add(DiagnosticsProperty('fundrequestlist', fundrequestlist));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationLoaded &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.responsemessage, responsemessage) ||
                const DeepCollectionEquality()
                    .equals(other.responsemessage, responsemessage)) &&
            (identical(other.fundrequest, fundrequest) ||
                const DeepCollectionEquality()
                    .equals(other.fundrequest, fundrequest)) &&
            (identical(other.refFund, refFund) ||
                const DeepCollectionEquality()
                    .equals(other.refFund, refFund)) &&
            (identical(other.fundrequestlist, fundrequestlist) ||
                const DeepCollectionEquality()
                    .equals(other.fundrequestlist, fundrequestlist)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(responsemessage) ^
      const DeepCollectionEquality().hash(fundrequest) ^
      const DeepCollectionEquality().hash(refFund) ^
      const DeepCollectionEquality().hash(fundrequestlist);

  @JsonKey(ignore: true)
  @override
  _$NotificationLoadedCopyWith<_NotificationLoaded> get copyWith =>
      __$NotificationLoadedCopyWithImpl<_NotificationLoaded>(this, _$identity);
}

abstract class _NotificationLoaded implements NotificationLoaded {
  factory _NotificationLoaded(
      {int success,
      int error,
      String responsemessage,
      Fund fundrequest,
      List<RefFund> refFund,
      List<Fund> fundrequestlist}) = _$_NotificationLoaded;

  @override
  int get success;
  @override
  int get error;
  @override
  String get responsemessage;
  @override
  Fund get fundrequest;
  @override
  List<RefFund> get refFund;
  @override
  List<Fund> get fundrequestlist;
  @override
  @JsonKey(ignore: true)
  _$NotificationLoadedCopyWith<_NotificationLoaded> get copyWith;
}
