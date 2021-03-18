// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bankdetails.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BankDetailsTearOff {
  const _$BankDetailsTearOff();

// ignore: unused_element
  _BankDetails call(
      {String id,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      List<BankList> banklist}) {
    return _BankDetails(
      id: id,
      acctnumber: acctnumber,
      acctname: acctname,
      amount: amount,
      note: note,
      banklist: banklist,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BankDetails = _$BankDetailsTearOff();

/// @nodoc
mixin _$BankDetails {
  String get id;
  String get acctnumber;
  String get acctname;
  String get amount;
  String get note;
  List<BankList> get banklist;

  @JsonKey(ignore: true)
  $BankDetailsCopyWith<BankDetails> get copyWith;
}

/// @nodoc
abstract class $BankDetailsCopyWith<$Res> {
  factory $BankDetailsCopyWith(
          BankDetails value, $Res Function(BankDetails) then) =
      _$BankDetailsCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      List<BankList> banklist});
}

/// @nodoc
class _$BankDetailsCopyWithImpl<$Res> implements $BankDetailsCopyWith<$Res> {
  _$BankDetailsCopyWithImpl(this._value, this._then);

  final BankDetails _value;
  // ignore: unused_field
  final $Res Function(BankDetails) _then;

  @override
  $Res call({
    Object id = freezed,
    Object acctnumber = freezed,
    Object acctname = freezed,
    Object amount = freezed,
    Object note = freezed,
    Object banklist = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      acctnumber:
          acctnumber == freezed ? _value.acctnumber : acctnumber as String,
      acctname: acctname == freezed ? _value.acctname : acctname as String,
      amount: amount == freezed ? _value.amount : amount as String,
      note: note == freezed ? _value.note : note as String,
      banklist:
          banklist == freezed ? _value.banklist : banklist as List<BankList>,
    ));
  }
}

/// @nodoc
abstract class _$BankDetailsCopyWith<$Res>
    implements $BankDetailsCopyWith<$Res> {
  factory _$BankDetailsCopyWith(
          _BankDetails value, $Res Function(_BankDetails) then) =
      __$BankDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      List<BankList> banklist});
}

/// @nodoc
class __$BankDetailsCopyWithImpl<$Res> extends _$BankDetailsCopyWithImpl<$Res>
    implements _$BankDetailsCopyWith<$Res> {
  __$BankDetailsCopyWithImpl(
      _BankDetails _value, $Res Function(_BankDetails) _then)
      : super(_value, (v) => _then(v as _BankDetails));

  @override
  _BankDetails get _value => super._value as _BankDetails;

  @override
  $Res call({
    Object id = freezed,
    Object acctnumber = freezed,
    Object acctname = freezed,
    Object amount = freezed,
    Object note = freezed,
    Object banklist = freezed,
  }) {
    return _then(_BankDetails(
      id: id == freezed ? _value.id : id as String,
      acctnumber:
          acctnumber == freezed ? _value.acctnumber : acctnumber as String,
      acctname: acctname == freezed ? _value.acctname : acctname as String,
      amount: amount == freezed ? _value.amount : amount as String,
      note: note == freezed ? _value.note : note as String,
      banklist:
          banklist == freezed ? _value.banklist : banklist as List<BankList>,
    ));
  }
}

/// @nodoc
class _$_BankDetails with DiagnosticableTreeMixin implements _BankDetails {
  _$_BankDetails(
      {this.id,
      this.acctnumber,
      this.acctname,
      this.amount,
      this.note,
      this.banklist});

  @override
  final String id;
  @override
  final String acctnumber;
  @override
  final String acctname;
  @override
  final String amount;
  @override
  final String note;
  @override
  final List<BankList> banklist;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BankDetails(id: $id, acctnumber: $acctnumber, acctname: $acctname, amount: $amount, note: $note, banklist: $banklist)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BankDetails'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('acctnumber', acctnumber))
      ..add(DiagnosticsProperty('acctname', acctname))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('banklist', banklist));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankDetails &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.acctnumber, acctnumber) ||
                const DeepCollectionEquality()
                    .equals(other.acctnumber, acctnumber)) &&
            (identical(other.acctname, acctname) ||
                const DeepCollectionEquality()
                    .equals(other.acctname, acctname)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.banklist, banklist) ||
                const DeepCollectionEquality()
                    .equals(other.banklist, banklist)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(acctnumber) ^
      const DeepCollectionEquality().hash(acctname) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(banklist);

  @JsonKey(ignore: true)
  @override
  _$BankDetailsCopyWith<_BankDetails> get copyWith =>
      __$BankDetailsCopyWithImpl<_BankDetails>(this, _$identity);
}

abstract class _BankDetails implements BankDetails {
  factory _BankDetails(
      {String id,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      List<BankList> banklist}) = _$_BankDetails;

  @override
  String get id;
  @override
  String get acctnumber;
  @override
  String get acctname;
  @override
  String get amount;
  @override
  String get note;
  @override
  List<BankList> get banklist;
  @override
  @JsonKey(ignore: true)
  _$BankDetailsCopyWith<_BankDetails> get copyWith;
}
