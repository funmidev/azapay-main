// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bank_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BankLoadedTearOff {
  const _$BankLoadedTearOff();

// ignore: unused_element
  _BankLoaded call(
      {String bankcode = AppStrings.empty,
      String bankname,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      String searchtext = AppStrings.empty,
      String bankaccountType,
      int isRadioSelectedBank,
      int isRadioSelectedAccountType,
      int success = 100,
      int error = 100,
      String responsemessage,
      List<BankList> banklist = const [],
      LinkBank linkbank = const LinkBank(data: [])}) {
    return _BankLoaded(
      bankcode: bankcode,
      bankname: bankname,
      acctnumber: acctnumber,
      acctname: acctname,
      amount: amount,
      note: note,
      searchtext: searchtext,
      bankaccountType: bankaccountType,
      isRadioSelectedBank: isRadioSelectedBank,
      isRadioSelectedAccountType: isRadioSelectedAccountType,
      success: success,
      error: error,
      responsemessage: responsemessage,
      banklist: banklist,
      linkbank: linkbank,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BankLoaded = _$BankLoadedTearOff();

/// @nodoc
mixin _$BankLoaded {
  String get bankcode;
  String get bankname;
  String get acctnumber;
  String get acctname;
  String get amount;
  String get note;
  String get searchtext;
  String get bankaccountType;
  int get isRadioSelectedBank;
  int get isRadioSelectedAccountType;
  int get success;
  int get error;
  String get responsemessage;
  List<BankList> get banklist;
  LinkBank get linkbank;

  @JsonKey(ignore: true)
  $BankLoadedCopyWith<BankLoaded> get copyWith;
}

/// @nodoc
abstract class $BankLoadedCopyWith<$Res> {
  factory $BankLoadedCopyWith(
          BankLoaded value, $Res Function(BankLoaded) then) =
      _$BankLoadedCopyWithImpl<$Res>;
  $Res call(
      {String bankcode,
      String bankname,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      String searchtext,
      String bankaccountType,
      int isRadioSelectedBank,
      int isRadioSelectedAccountType,
      int success,
      int error,
      String responsemessage,
      List<BankList> banklist,
      LinkBank linkbank});
}

/// @nodoc
class _$BankLoadedCopyWithImpl<$Res> implements $BankLoadedCopyWith<$Res> {
  _$BankLoadedCopyWithImpl(this._value, this._then);

  final BankLoaded _value;
  // ignore: unused_field
  final $Res Function(BankLoaded) _then;

  @override
  $Res call({
    Object bankcode = freezed,
    Object bankname = freezed,
    Object acctnumber = freezed,
    Object acctname = freezed,
    Object amount = freezed,
    Object note = freezed,
    Object searchtext = freezed,
    Object bankaccountType = freezed,
    Object isRadioSelectedBank = freezed,
    Object isRadioSelectedAccountType = freezed,
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
    Object banklist = freezed,
    Object linkbank = freezed,
  }) {
    return _then(_value.copyWith(
      bankcode: bankcode == freezed ? _value.bankcode : bankcode as String,
      bankname: bankname == freezed ? _value.bankname : bankname as String,
      acctnumber:
          acctnumber == freezed ? _value.acctnumber : acctnumber as String,
      acctname: acctname == freezed ? _value.acctname : acctname as String,
      amount: amount == freezed ? _value.amount : amount as String,
      note: note == freezed ? _value.note : note as String,
      searchtext:
          searchtext == freezed ? _value.searchtext : searchtext as String,
      bankaccountType: bankaccountType == freezed
          ? _value.bankaccountType
          : bankaccountType as String,
      isRadioSelectedBank: isRadioSelectedBank == freezed
          ? _value.isRadioSelectedBank
          : isRadioSelectedBank as int,
      isRadioSelectedAccountType: isRadioSelectedAccountType == freezed
          ? _value.isRadioSelectedAccountType
          : isRadioSelectedAccountType as int,
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
      banklist:
          banklist == freezed ? _value.banklist : banklist as List<BankList>,
      linkbank: linkbank == freezed ? _value.linkbank : linkbank as LinkBank,
    ));
  }
}

/// @nodoc
abstract class _$BankLoadedCopyWith<$Res> implements $BankLoadedCopyWith<$Res> {
  factory _$BankLoadedCopyWith(
          _BankLoaded value, $Res Function(_BankLoaded) then) =
      __$BankLoadedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String bankcode,
      String bankname,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      String searchtext,
      String bankaccountType,
      int isRadioSelectedBank,
      int isRadioSelectedAccountType,
      int success,
      int error,
      String responsemessage,
      List<BankList> banklist,
      LinkBank linkbank});
}

/// @nodoc
class __$BankLoadedCopyWithImpl<$Res> extends _$BankLoadedCopyWithImpl<$Res>
    implements _$BankLoadedCopyWith<$Res> {
  __$BankLoadedCopyWithImpl(
      _BankLoaded _value, $Res Function(_BankLoaded) _then)
      : super(_value, (v) => _then(v as _BankLoaded));

  @override
  _BankLoaded get _value => super._value as _BankLoaded;

  @override
  $Res call({
    Object bankcode = freezed,
    Object bankname = freezed,
    Object acctnumber = freezed,
    Object acctname = freezed,
    Object amount = freezed,
    Object note = freezed,
    Object searchtext = freezed,
    Object bankaccountType = freezed,
    Object isRadioSelectedBank = freezed,
    Object isRadioSelectedAccountType = freezed,
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
    Object banklist = freezed,
    Object linkbank = freezed,
  }) {
    return _then(_BankLoaded(
      bankcode: bankcode == freezed ? _value.bankcode : bankcode as String,
      bankname: bankname == freezed ? _value.bankname : bankname as String,
      acctnumber:
          acctnumber == freezed ? _value.acctnumber : acctnumber as String,
      acctname: acctname == freezed ? _value.acctname : acctname as String,
      amount: amount == freezed ? _value.amount : amount as String,
      note: note == freezed ? _value.note : note as String,
      searchtext:
          searchtext == freezed ? _value.searchtext : searchtext as String,
      bankaccountType: bankaccountType == freezed
          ? _value.bankaccountType
          : bankaccountType as String,
      isRadioSelectedBank: isRadioSelectedBank == freezed
          ? _value.isRadioSelectedBank
          : isRadioSelectedBank as int,
      isRadioSelectedAccountType: isRadioSelectedAccountType == freezed
          ? _value.isRadioSelectedAccountType
          : isRadioSelectedAccountType as int,
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
      banklist:
          banklist == freezed ? _value.banklist : banklist as List<BankList>,
      linkbank: linkbank == freezed ? _value.linkbank : linkbank as LinkBank,
    ));
  }
}

/// @nodoc
class _$_BankLoaded with DiagnosticableTreeMixin implements _BankLoaded {
  _$_BankLoaded(
      {this.bankcode = AppStrings.empty,
      this.bankname,
      this.acctnumber,
      this.acctname,
      this.amount,
      this.note,
      this.searchtext = AppStrings.empty,
      this.bankaccountType,
      this.isRadioSelectedBank,
      this.isRadioSelectedAccountType,
      this.success = 100,
      this.error = 100,
      this.responsemessage,
      this.banklist = const [],
      this.linkbank = const LinkBank(data: [])})
      : assert(bankcode != null),
        assert(searchtext != null),
        assert(success != null),
        assert(error != null),
        assert(banklist != null),
        assert(linkbank != null);

  @JsonKey(defaultValue: AppStrings.empty)
  @override
  final String bankcode;
  @override
  final String bankname;
  @override
  final String acctnumber;
  @override
  final String acctname;
  @override
  final String amount;
  @override
  final String note;
  @JsonKey(defaultValue: AppStrings.empty)
  @override
  final String searchtext;
  @override
  final String bankaccountType;
  @override
  final int isRadioSelectedBank;
  @override
  final int isRadioSelectedAccountType;
  @JsonKey(defaultValue: 100)
  @override
  final int success;
  @JsonKey(defaultValue: 100)
  @override
  final int error;
  @override
  final String responsemessage;
  @JsonKey(defaultValue: const [])
  @override
  final List<BankList> banklist;
  @JsonKey(defaultValue: const LinkBank(data: []))
  @override
  final LinkBank linkbank;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BankLoaded(bankcode: $bankcode, bankname: $bankname, acctnumber: $acctnumber, acctname: $acctname, amount: $amount, note: $note, searchtext: $searchtext, bankaccountType: $bankaccountType, isRadioSelectedBank: $isRadioSelectedBank, isRadioSelectedAccountType: $isRadioSelectedAccountType, success: $success, error: $error, responsemessage: $responsemessage, banklist: $banklist, linkbank: $linkbank)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BankLoaded'))
      ..add(DiagnosticsProperty('bankcode', bankcode))
      ..add(DiagnosticsProperty('bankname', bankname))
      ..add(DiagnosticsProperty('acctnumber', acctnumber))
      ..add(DiagnosticsProperty('acctname', acctname))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('searchtext', searchtext))
      ..add(DiagnosticsProperty('bankaccountType', bankaccountType))
      ..add(DiagnosticsProperty('isRadioSelectedBank', isRadioSelectedBank))
      ..add(DiagnosticsProperty(
          'isRadioSelectedAccountType', isRadioSelectedAccountType))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('responsemessage', responsemessage))
      ..add(DiagnosticsProperty('banklist', banklist))
      ..add(DiagnosticsProperty('linkbank', linkbank));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BankLoaded &&
            (identical(other.bankcode, bankcode) ||
                const DeepCollectionEquality()
                    .equals(other.bankcode, bankcode)) &&
            (identical(other.bankname, bankname) ||
                const DeepCollectionEquality()
                    .equals(other.bankname, bankname)) &&
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
            (identical(other.searchtext, searchtext) ||
                const DeepCollectionEquality()
                    .equals(other.searchtext, searchtext)) &&
            (identical(other.bankaccountType, bankaccountType) ||
                const DeepCollectionEquality()
                    .equals(other.bankaccountType, bankaccountType)) &&
            (identical(other.isRadioSelectedBank, isRadioSelectedBank) ||
                const DeepCollectionEquality()
                    .equals(other.isRadioSelectedBank, isRadioSelectedBank)) &&
            (identical(other.isRadioSelectedAccountType,
                    isRadioSelectedAccountType) ||
                const DeepCollectionEquality().equals(
                    other.isRadioSelectedAccountType,
                    isRadioSelectedAccountType)) &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.responsemessage, responsemessage) ||
                const DeepCollectionEquality()
                    .equals(other.responsemessage, responsemessage)) &&
            (identical(other.banklist, banklist) ||
                const DeepCollectionEquality()
                    .equals(other.banklist, banklist)) &&
            (identical(other.linkbank, linkbank) ||
                const DeepCollectionEquality()
                    .equals(other.linkbank, linkbank)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bankcode) ^
      const DeepCollectionEquality().hash(bankname) ^
      const DeepCollectionEquality().hash(acctnumber) ^
      const DeepCollectionEquality().hash(acctname) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(searchtext) ^
      const DeepCollectionEquality().hash(bankaccountType) ^
      const DeepCollectionEquality().hash(isRadioSelectedBank) ^
      const DeepCollectionEquality().hash(isRadioSelectedAccountType) ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(responsemessage) ^
      const DeepCollectionEquality().hash(banklist) ^
      const DeepCollectionEquality().hash(linkbank);

  @JsonKey(ignore: true)
  @override
  _$BankLoadedCopyWith<_BankLoaded> get copyWith =>
      __$BankLoadedCopyWithImpl<_BankLoaded>(this, _$identity);
}

abstract class _BankLoaded implements BankLoaded {
  factory _BankLoaded(
      {String bankcode,
      String bankname,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      String searchtext,
      String bankaccountType,
      int isRadioSelectedBank,
      int isRadioSelectedAccountType,
      int success,
      int error,
      String responsemessage,
      List<BankList> banklist,
      LinkBank linkbank}) = _$_BankLoaded;

  @override
  String get bankcode;
  @override
  String get bankname;
  @override
  String get acctnumber;
  @override
  String get acctname;
  @override
  String get amount;
  @override
  String get note;
  @override
  String get searchtext;
  @override
  String get bankaccountType;
  @override
  int get isRadioSelectedBank;
  @override
  int get isRadioSelectedAccountType;
  @override
  int get success;
  @override
  int get error;
  @override
  String get responsemessage;
  @override
  List<BankList> get banklist;
  @override
  LinkBank get linkbank;
  @override
  @JsonKey(ignore: true)
  _$BankLoadedCopyWith<_BankLoaded> get copyWith;
}
