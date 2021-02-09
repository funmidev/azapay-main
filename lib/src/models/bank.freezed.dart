// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AllBankTearOff {
  const _$AllBankTearOff();

// ignore: unused_element
  _AllBank call(
      {String id,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      List<BankList> banklist}) {
    return _AllBank(
      id: id,
      acctnumber: acctnumber,
      acctname: acctname,
      amount: amount,
      note: note,
      banklist: banklist,
    );
  }
}

// ignore: unused_element
const $AllBank = _$AllBankTearOff();

mixin _$AllBank {
  String get id;
  String get acctnumber;
  String get acctname;
  String get amount;
  String get note;
  List<BankList> get banklist;

  $AllBankCopyWith<AllBank> get copyWith;
}

abstract class $AllBankCopyWith<$Res> {
  factory $AllBankCopyWith(AllBank value, $Res Function(AllBank) then) =
      _$AllBankCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      List<BankList> banklist});
}

class _$AllBankCopyWithImpl<$Res> implements $AllBankCopyWith<$Res> {
  _$AllBankCopyWithImpl(this._value, this._then);

  final AllBank _value;
  // ignore: unused_field
  final $Res Function(AllBank) _then;

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

abstract class _$AllBankCopyWith<$Res> implements $AllBankCopyWith<$Res> {
  factory _$AllBankCopyWith(_AllBank value, $Res Function(_AllBank) then) =
      __$AllBankCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      List<BankList> banklist});
}

class __$AllBankCopyWithImpl<$Res> extends _$AllBankCopyWithImpl<$Res>
    implements _$AllBankCopyWith<$Res> {
  __$AllBankCopyWithImpl(_AllBank _value, $Res Function(_AllBank) _then)
      : super(_value, (v) => _then(v as _AllBank));

  @override
  _AllBank get _value => super._value as _AllBank;

  @override
  $Res call({
    Object id = freezed,
    Object acctnumber = freezed,
    Object acctname = freezed,
    Object amount = freezed,
    Object note = freezed,
    Object banklist = freezed,
  }) {
    return _then(_AllBank(
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

class _$_AllBank with DiagnosticableTreeMixin implements _AllBank {
  _$_AllBank(
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
    return 'AllBank(id: $id, acctnumber: $acctnumber, acctname: $acctname, amount: $amount, note: $note, banklist: $banklist)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AllBank'))
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
        (other is _AllBank &&
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

  @override
  _$AllBankCopyWith<_AllBank> get copyWith =>
      __$AllBankCopyWithImpl<_AllBank>(this, _$identity);
}

abstract class _AllBank implements AllBank {
  factory _AllBank(
      {String id,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      List<BankList> banklist}) = _$_AllBank;

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
  _$AllBankCopyWith<_AllBank> get copyWith;
}
