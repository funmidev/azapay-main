// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PayBill<T> _$PayBillFromJson<T>(Map<String, dynamic> json) {
  return _PayBill<T>.fromJson(json);
}

class _$PayBillTearOff {
  const _$PayBillTearOff();

// ignore: unused_element
  _PayBill<T> call<T>(
      {String product,
      String phone,
      String categoryName,
      String billCode,
      String productCode,
      String name,
      String smartcard,
      String categoryId,
      String meterNo,
      String accountName,
      String telco,
      @PayBillConverter() T amount,
      String transactionPin}) {
    return _PayBill<T>(
      product: product,
      phone: phone,
      categoryName: categoryName,
      billCode: billCode,
      productCode: productCode,
      name: name,
      smartcard: smartcard,
      categoryId: categoryId,
      meterNo: meterNo,
      accountName: accountName,
      telco: telco,
      amount: amount,
      transactionPin: transactionPin,
    );
  }
}

// ignore: unused_element
const $PayBill = _$PayBillTearOff();

mixin _$PayBill<T> {
  String get product;
  String get phone;
  String get categoryName;
  String get billCode;
  String get productCode;
  String get name;
  String get smartcard;
  String get categoryId;
  String get meterNo;
  String get accountName;
  String get telco;
  @PayBillConverter()
  T get amount;
  String get transactionPin;

  Map<String, dynamic> toJson();
  $PayBillCopyWith<T, PayBill<T>> get copyWith;
}

abstract class $PayBillCopyWith<T, $Res> {
  factory $PayBillCopyWith(PayBill<T> value, $Res Function(PayBill<T>) then) =
      _$PayBillCopyWithImpl<T, $Res>;
  $Res call(
      {String product,
      String phone,
      String categoryName,
      String billCode,
      String productCode,
      String name,
      String smartcard,
      String categoryId,
      String meterNo,
      String accountName,
      String telco,
      @PayBillConverter() T amount,
      String transactionPin});
}

class _$PayBillCopyWithImpl<T, $Res> implements $PayBillCopyWith<T, $Res> {
  _$PayBillCopyWithImpl(this._value, this._then);

  final PayBill<T> _value;
  // ignore: unused_field
  final $Res Function(PayBill<T>) _then;

  @override
  $Res call({
    Object product = freezed,
    Object phone = freezed,
    Object categoryName = freezed,
    Object billCode = freezed,
    Object productCode = freezed,
    Object name = freezed,
    Object smartcard = freezed,
    Object categoryId = freezed,
    Object meterNo = freezed,
    Object accountName = freezed,
    Object telco = freezed,
    Object amount = freezed,
    Object transactionPin = freezed,
  }) {
    return _then(_value.copyWith(
      product: product == freezed ? _value.product : product as String,
      phone: phone == freezed ? _value.phone : phone as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName as String,
      billCode: billCode == freezed ? _value.billCode : billCode as String,
      productCode:
          productCode == freezed ? _value.productCode : productCode as String,
      name: name == freezed ? _value.name : name as String,
      smartcard: smartcard == freezed ? _value.smartcard : smartcard as String,
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as String,
      meterNo: meterNo == freezed ? _value.meterNo : meterNo as String,
      accountName:
          accountName == freezed ? _value.accountName : accountName as String,
      telco: telco == freezed ? _value.telco : telco as String,
      amount: amount == freezed ? _value.amount : amount as T,
      transactionPin: transactionPin == freezed
          ? _value.transactionPin
          : transactionPin as String,
    ));
  }
}

abstract class _$PayBillCopyWith<T, $Res> implements $PayBillCopyWith<T, $Res> {
  factory _$PayBillCopyWith(
          _PayBill<T> value, $Res Function(_PayBill<T>) then) =
      __$PayBillCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {String product,
      String phone,
      String categoryName,
      String billCode,
      String productCode,
      String name,
      String smartcard,
      String categoryId,
      String meterNo,
      String accountName,
      String telco,
      @PayBillConverter() T amount,
      String transactionPin});
}

class __$PayBillCopyWithImpl<T, $Res> extends _$PayBillCopyWithImpl<T, $Res>
    implements _$PayBillCopyWith<T, $Res> {
  __$PayBillCopyWithImpl(_PayBill<T> _value, $Res Function(_PayBill<T>) _then)
      : super(_value, (v) => _then(v as _PayBill<T>));

  @override
  _PayBill<T> get _value => super._value as _PayBill<T>;

  @override
  $Res call({
    Object product = freezed,
    Object phone = freezed,
    Object categoryName = freezed,
    Object billCode = freezed,
    Object productCode = freezed,
    Object name = freezed,
    Object smartcard = freezed,
    Object categoryId = freezed,
    Object meterNo = freezed,
    Object accountName = freezed,
    Object telco = freezed,
    Object amount = freezed,
    Object transactionPin = freezed,
  }) {
    return _then(_PayBill<T>(
      product: product == freezed ? _value.product : product as String,
      phone: phone == freezed ? _value.phone : phone as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName as String,
      billCode: billCode == freezed ? _value.billCode : billCode as String,
      productCode:
          productCode == freezed ? _value.productCode : productCode as String,
      name: name == freezed ? _value.name : name as String,
      smartcard: smartcard == freezed ? _value.smartcard : smartcard as String,
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as String,
      meterNo: meterNo == freezed ? _value.meterNo : meterNo as String,
      accountName:
          accountName == freezed ? _value.accountName : accountName as String,
      telco: telco == freezed ? _value.telco : telco as String,
      amount: amount == freezed ? _value.amount : amount as T,
      transactionPin: transactionPin == freezed
          ? _value.transactionPin
          : transactionPin as String,
    ));
  }
}

@JsonSerializable()
class _$_PayBill<T> with DiagnosticableTreeMixin implements _PayBill<T> {
  _$_PayBill(
      {this.product,
      this.phone,
      this.categoryName,
      this.billCode,
      this.productCode,
      this.name,
      this.smartcard,
      this.categoryId,
      this.meterNo,
      this.accountName,
      this.telco,
      @PayBillConverter() this.amount,
      this.transactionPin});

  factory _$_PayBill.fromJson(Map<String, dynamic> json) =>
      _$_$_PayBillFromJson(json);

  @override
  final String product;
  @override
  final String phone;
  @override
  final String categoryName;
  @override
  final String billCode;
  @override
  final String productCode;
  @override
  final String name;
  @override
  final String smartcard;
  @override
  final String categoryId;
  @override
  final String meterNo;
  @override
  final String accountName;
  @override
  final String telco;
  @override
  @PayBillConverter()
  final T amount;
  @override
  final String transactionPin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PayBill<$T>(product: $product, phone: $phone, categoryName: $categoryName, billCode: $billCode, productCode: $productCode, name: $name, smartcard: $smartcard, categoryId: $categoryId, meterNo: $meterNo, accountName: $accountName, telco: $telco, amount: $amount, transactionPin: $transactionPin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PayBill<$T>'))
      ..add(DiagnosticsProperty('product', product))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('categoryName', categoryName))
      ..add(DiagnosticsProperty('billCode', billCode))
      ..add(DiagnosticsProperty('productCode', productCode))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('smartcard', smartcard))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('meterNo', meterNo))
      ..add(DiagnosticsProperty('accountName', accountName))
      ..add(DiagnosticsProperty('telco', telco))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('transactionPin', transactionPin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayBill<T> &&
            (identical(other.product, product) ||
                const DeepCollectionEquality()
                    .equals(other.product, product)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.billCode, billCode) ||
                const DeepCollectionEquality()
                    .equals(other.billCode, billCode)) &&
            (identical(other.productCode, productCode) ||
                const DeepCollectionEquality()
                    .equals(other.productCode, productCode)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.smartcard, smartcard) ||
                const DeepCollectionEquality()
                    .equals(other.smartcard, smartcard)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.meterNo, meterNo) ||
                const DeepCollectionEquality()
                    .equals(other.meterNo, meterNo)) &&
            (identical(other.accountName, accountName) ||
                const DeepCollectionEquality()
                    .equals(other.accountName, accountName)) &&
            (identical(other.telco, telco) ||
                const DeepCollectionEquality().equals(other.telco, telco)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.transactionPin, transactionPin) ||
                const DeepCollectionEquality()
                    .equals(other.transactionPin, transactionPin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(product) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(billCode) ^
      const DeepCollectionEquality().hash(productCode) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(smartcard) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(meterNo) ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(telco) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(transactionPin);

  @override
  _$PayBillCopyWith<T, _PayBill<T>> get copyWith =>
      __$PayBillCopyWithImpl<T, _PayBill<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PayBillToJson(this);
  }
}

abstract class _PayBill<T> implements PayBill<T> {
  factory _PayBill(
      {String product,
      String phone,
      String categoryName,
      String billCode,
      String productCode,
      String name,
      String smartcard,
      String categoryId,
      String meterNo,
      String accountName,
      String telco,
      @PayBillConverter() T amount,
      String transactionPin}) = _$_PayBill<T>;

  factory _PayBill.fromJson(Map<String, dynamic> json) = _$_PayBill<T>.fromJson;

  @override
  String get product;
  @override
  String get phone;
  @override
  String get categoryName;
  @override
  String get billCode;
  @override
  String get productCode;
  @override
  String get name;
  @override
  String get smartcard;
  @override
  String get categoryId;
  @override
  String get meterNo;
  @override
  String get accountName;
  @override
  String get telco;
  @override
  @PayBillConverter()
  T get amount;
  @override
  String get transactionPin;
  @override
  _$PayBillCopyWith<T, _PayBill<T>> get copyWith;
}
