// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'paybills_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PaybillsInputDataTearOff {
  const _$PaybillsInputDataTearOff();

// ignore: unused_element
  _PaybillsInputData<T, S> call<T, S>(
      {int service,
      String product,
      String phone = '',
      String categoryName,
      String productCode,
      String billcode,
      String name,
      String smartcardormeterNo = '',
      String categoryId,
      int isRadioSelectedBillCategoryProvider,
      int isRadioSelectedBillProductProvider,
      int isRadioSelectedBillSubProductProvider,
      int isRadioSelectedPhoneNumber,
      VerifyCustomer verifyCustomer =
          const VerifyCustomer(data: const VerifyCustomerData(name: '')),
      GetPayBills<T> getPayBillsCategory = const GetPayBills(data: const []),
      GetPayBills<S> getPayBillsProduct = const GetPayBills(data: const []),
      int success = 100,
      int error = 100,
      String responsemessage,
      double amount,
      String transactionPin}) {
    return _PaybillsInputData<T, S>(
      service: service,
      product: product,
      phone: phone,
      categoryName: categoryName,
      productCode: productCode,
      billcode: billcode,
      name: name,
      smartcardormeterNo: smartcardormeterNo,
      categoryId: categoryId,
      isRadioSelectedBillCategoryProvider: isRadioSelectedBillCategoryProvider,
      isRadioSelectedBillProductProvider: isRadioSelectedBillProductProvider,
      isRadioSelectedBillSubProductProvider:
          isRadioSelectedBillSubProductProvider,
      isRadioSelectedPhoneNumber: isRadioSelectedPhoneNumber,
      verifyCustomer: verifyCustomer,
      getPayBillsCategory: getPayBillsCategory,
      getPayBillsProduct: getPayBillsProduct,
      success: success,
      error: error,
      responsemessage: responsemessage,
      amount: amount,
      transactionPin: transactionPin,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PaybillsInputData = _$PaybillsInputDataTearOff();

/// @nodoc
mixin _$PaybillsInputData<T, S> {
  int get service;
  String get product;
  String get phone;
  String get categoryName;
  String get productCode;
  String get billcode;
  String get name;
  String get smartcardormeterNo;
  String get categoryId;
  int get isRadioSelectedBillCategoryProvider;
  int get isRadioSelectedBillProductProvider;
  int get isRadioSelectedBillSubProductProvider;
  int get isRadioSelectedPhoneNumber;
  VerifyCustomer get verifyCustomer;
  GetPayBills<T> get getPayBillsCategory;
  GetPayBills<S> get getPayBillsProduct;
  int get success;
  int get error;
  String get responsemessage;
  double get amount;
  String get transactionPin;

  @JsonKey(ignore: true)
  $PaybillsInputDataCopyWith<T, S, PaybillsInputData<T, S>> get copyWith;
}

/// @nodoc
abstract class $PaybillsInputDataCopyWith<T, S, $Res> {
  factory $PaybillsInputDataCopyWith(PaybillsInputData<T, S> value,
          $Res Function(PaybillsInputData<T, S>) then) =
      _$PaybillsInputDataCopyWithImpl<T, S, $Res>;
  $Res call(
      {int service,
      String product,
      String phone,
      String categoryName,
      String productCode,
      String billcode,
      String name,
      String smartcardormeterNo,
      String categoryId,
      int isRadioSelectedBillCategoryProvider,
      int isRadioSelectedBillProductProvider,
      int isRadioSelectedBillSubProductProvider,
      int isRadioSelectedPhoneNumber,
      VerifyCustomer verifyCustomer,
      GetPayBills<T> getPayBillsCategory,
      GetPayBills<S> getPayBillsProduct,
      int success,
      int error,
      String responsemessage,
      double amount,
      String transactionPin});
}

/// @nodoc
class _$PaybillsInputDataCopyWithImpl<T, S, $Res>
    implements $PaybillsInputDataCopyWith<T, S, $Res> {
  _$PaybillsInputDataCopyWithImpl(this._value, this._then);

  final PaybillsInputData<T, S> _value;
  // ignore: unused_field
  final $Res Function(PaybillsInputData<T, S>) _then;

  @override
  $Res call({
    Object service = freezed,
    Object product = freezed,
    Object phone = freezed,
    Object categoryName = freezed,
    Object productCode = freezed,
    Object billcode = freezed,
    Object name = freezed,
    Object smartcardormeterNo = freezed,
    Object categoryId = freezed,
    Object isRadioSelectedBillCategoryProvider = freezed,
    Object isRadioSelectedBillProductProvider = freezed,
    Object isRadioSelectedBillSubProductProvider = freezed,
    Object isRadioSelectedPhoneNumber = freezed,
    Object verifyCustomer = freezed,
    Object getPayBillsCategory = freezed,
    Object getPayBillsProduct = freezed,
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
    Object amount = freezed,
    Object transactionPin = freezed,
  }) {
    return _then(_value.copyWith(
      service: service == freezed ? _value.service : service as int,
      product: product == freezed ? _value.product : product as String,
      phone: phone == freezed ? _value.phone : phone as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName as String,
      productCode:
          productCode == freezed ? _value.productCode : productCode as String,
      billcode: billcode == freezed ? _value.billcode : billcode as String,
      name: name == freezed ? _value.name : name as String,
      smartcardormeterNo: smartcardormeterNo == freezed
          ? _value.smartcardormeterNo
          : smartcardormeterNo as String,
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as String,
      isRadioSelectedBillCategoryProvider:
          isRadioSelectedBillCategoryProvider == freezed
              ? _value.isRadioSelectedBillCategoryProvider
              : isRadioSelectedBillCategoryProvider as int,
      isRadioSelectedBillProductProvider:
          isRadioSelectedBillProductProvider == freezed
              ? _value.isRadioSelectedBillProductProvider
              : isRadioSelectedBillProductProvider as int,
      isRadioSelectedBillSubProductProvider:
          isRadioSelectedBillSubProductProvider == freezed
              ? _value.isRadioSelectedBillSubProductProvider
              : isRadioSelectedBillSubProductProvider as int,
      isRadioSelectedPhoneNumber: isRadioSelectedPhoneNumber == freezed
          ? _value.isRadioSelectedPhoneNumber
          : isRadioSelectedPhoneNumber as int,
      verifyCustomer: verifyCustomer == freezed
          ? _value.verifyCustomer
          : verifyCustomer as VerifyCustomer,
      getPayBillsCategory: getPayBillsCategory == freezed
          ? _value.getPayBillsCategory
          : getPayBillsCategory as GetPayBills<T>,
      getPayBillsProduct: getPayBillsProduct == freezed
          ? _value.getPayBillsProduct
          : getPayBillsProduct as GetPayBills<S>,
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
      amount: amount == freezed ? _value.amount : amount as double,
      transactionPin: transactionPin == freezed
          ? _value.transactionPin
          : transactionPin as String,
    ));
  }
}

/// @nodoc
abstract class _$PaybillsInputDataCopyWith<T, S, $Res>
    implements $PaybillsInputDataCopyWith<T, S, $Res> {
  factory _$PaybillsInputDataCopyWith(_PaybillsInputData<T, S> value,
          $Res Function(_PaybillsInputData<T, S>) then) =
      __$PaybillsInputDataCopyWithImpl<T, S, $Res>;
  @override
  $Res call(
      {int service,
      String product,
      String phone,
      String categoryName,
      String productCode,
      String billcode,
      String name,
      String smartcardormeterNo,
      String categoryId,
      int isRadioSelectedBillCategoryProvider,
      int isRadioSelectedBillProductProvider,
      int isRadioSelectedBillSubProductProvider,
      int isRadioSelectedPhoneNumber,
      VerifyCustomer verifyCustomer,
      GetPayBills<T> getPayBillsCategory,
      GetPayBills<S> getPayBillsProduct,
      int success,
      int error,
      String responsemessage,
      double amount,
      String transactionPin});
}

/// @nodoc
class __$PaybillsInputDataCopyWithImpl<T, S, $Res>
    extends _$PaybillsInputDataCopyWithImpl<T, S, $Res>
    implements _$PaybillsInputDataCopyWith<T, S, $Res> {
  __$PaybillsInputDataCopyWithImpl(_PaybillsInputData<T, S> _value,
      $Res Function(_PaybillsInputData<T, S>) _then)
      : super(_value, (v) => _then(v as _PaybillsInputData<T, S>));

  @override
  _PaybillsInputData<T, S> get _value =>
      super._value as _PaybillsInputData<T, S>;

  @override
  $Res call({
    Object service = freezed,
    Object product = freezed,
    Object phone = freezed,
    Object categoryName = freezed,
    Object productCode = freezed,
    Object billcode = freezed,
    Object name = freezed,
    Object smartcardormeterNo = freezed,
    Object categoryId = freezed,
    Object isRadioSelectedBillCategoryProvider = freezed,
    Object isRadioSelectedBillProductProvider = freezed,
    Object isRadioSelectedBillSubProductProvider = freezed,
    Object isRadioSelectedPhoneNumber = freezed,
    Object verifyCustomer = freezed,
    Object getPayBillsCategory = freezed,
    Object getPayBillsProduct = freezed,
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
    Object amount = freezed,
    Object transactionPin = freezed,
  }) {
    return _then(_PaybillsInputData<T, S>(
      service: service == freezed ? _value.service : service as int,
      product: product == freezed ? _value.product : product as String,
      phone: phone == freezed ? _value.phone : phone as String,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName as String,
      productCode:
          productCode == freezed ? _value.productCode : productCode as String,
      billcode: billcode == freezed ? _value.billcode : billcode as String,
      name: name == freezed ? _value.name : name as String,
      smartcardormeterNo: smartcardormeterNo == freezed
          ? _value.smartcardormeterNo
          : smartcardormeterNo as String,
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as String,
      isRadioSelectedBillCategoryProvider:
          isRadioSelectedBillCategoryProvider == freezed
              ? _value.isRadioSelectedBillCategoryProvider
              : isRadioSelectedBillCategoryProvider as int,
      isRadioSelectedBillProductProvider:
          isRadioSelectedBillProductProvider == freezed
              ? _value.isRadioSelectedBillProductProvider
              : isRadioSelectedBillProductProvider as int,
      isRadioSelectedBillSubProductProvider:
          isRadioSelectedBillSubProductProvider == freezed
              ? _value.isRadioSelectedBillSubProductProvider
              : isRadioSelectedBillSubProductProvider as int,
      isRadioSelectedPhoneNumber: isRadioSelectedPhoneNumber == freezed
          ? _value.isRadioSelectedPhoneNumber
          : isRadioSelectedPhoneNumber as int,
      verifyCustomer: verifyCustomer == freezed
          ? _value.verifyCustomer
          : verifyCustomer as VerifyCustomer,
      getPayBillsCategory: getPayBillsCategory == freezed
          ? _value.getPayBillsCategory
          : getPayBillsCategory as GetPayBills<T>,
      getPayBillsProduct: getPayBillsProduct == freezed
          ? _value.getPayBillsProduct
          : getPayBillsProduct as GetPayBills<S>,
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
      amount: amount == freezed ? _value.amount : amount as double,
      transactionPin: transactionPin == freezed
          ? _value.transactionPin
          : transactionPin as String,
    ));
  }
}

/// @nodoc
class _$_PaybillsInputData<T, S>
    with DiagnosticableTreeMixin
    implements _PaybillsInputData<T, S> {
  _$_PaybillsInputData(
      {this.service,
      this.product,
      this.phone = '',
      this.categoryName,
      this.productCode,
      this.billcode,
      this.name,
      this.smartcardormeterNo = '',
      this.categoryId,
      this.isRadioSelectedBillCategoryProvider,
      this.isRadioSelectedBillProductProvider,
      this.isRadioSelectedBillSubProductProvider,
      this.isRadioSelectedPhoneNumber,
      this.verifyCustomer =
          const VerifyCustomer(data: const VerifyCustomerData(name: '')),
      this.getPayBillsCategory = const GetPayBills(data: const []),
      this.getPayBillsProduct = const GetPayBills(data: const []),
      this.success = 100,
      this.error = 100,
      this.responsemessage,
      this.amount,
      this.transactionPin})
      : assert(phone != null),
        assert(smartcardormeterNo != null),
        assert(verifyCustomer != null),
        assert(getPayBillsCategory != null),
        assert(getPayBillsProduct != null),
        assert(success != null),
        assert(error != null);

  @override
  final int service;
  @override
  final String product;
  @JsonKey(defaultValue: '')
  @override
  final String phone;
  @override
  final String categoryName;
  @override
  final String productCode;
  @override
  final String billcode;
  @override
  final String name;
  @JsonKey(defaultValue: '')
  @override
  final String smartcardormeterNo;
  @override
  final String categoryId;
  @override
  final int isRadioSelectedBillCategoryProvider;
  @override
  final int isRadioSelectedBillProductProvider;
  @override
  final int isRadioSelectedBillSubProductProvider;
  @override
  final int isRadioSelectedPhoneNumber;
  @JsonKey(
      defaultValue:
          const VerifyCustomer(data: const VerifyCustomerData(name: '')))
  @override
  final VerifyCustomer verifyCustomer;
  @JsonKey(defaultValue: const GetPayBills(data: const []))
  @override
  final GetPayBills<T> getPayBillsCategory;
  @JsonKey(defaultValue: const GetPayBills(data: const []))
  @override
  final GetPayBills<S> getPayBillsProduct;
  @JsonKey(defaultValue: 100)
  @override
  final int success;
  @JsonKey(defaultValue: 100)
  @override
  final int error;
  @override
  final String responsemessage;
  @override
  final double amount;
  @override
  final String transactionPin;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaybillsInputData<$T, $S>(service: $service, product: $product, phone: $phone, categoryName: $categoryName, productCode: $productCode, billcode: $billcode, name: $name, smartcardormeterNo: $smartcardormeterNo, categoryId: $categoryId, isRadioSelectedBillCategoryProvider: $isRadioSelectedBillCategoryProvider, isRadioSelectedBillProductProvider: $isRadioSelectedBillProductProvider, isRadioSelectedBillSubProductProvider: $isRadioSelectedBillSubProductProvider, isRadioSelectedPhoneNumber: $isRadioSelectedPhoneNumber, verifyCustomer: $verifyCustomer, getPayBillsCategory: $getPayBillsCategory, getPayBillsProduct: $getPayBillsProduct, success: $success, error: $error, responsemessage: $responsemessage, amount: $amount, transactionPin: $transactionPin)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaybillsInputData<$T, $S>'))
      ..add(DiagnosticsProperty('service', service))
      ..add(DiagnosticsProperty('product', product))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('categoryName', categoryName))
      ..add(DiagnosticsProperty('productCode', productCode))
      ..add(DiagnosticsProperty('billcode', billcode))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('smartcardormeterNo', smartcardormeterNo))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('isRadioSelectedBillCategoryProvider',
          isRadioSelectedBillCategoryProvider))
      ..add(DiagnosticsProperty('isRadioSelectedBillProductProvider',
          isRadioSelectedBillProductProvider))
      ..add(DiagnosticsProperty('isRadioSelectedBillSubProductProvider',
          isRadioSelectedBillSubProductProvider))
      ..add(DiagnosticsProperty(
          'isRadioSelectedPhoneNumber', isRadioSelectedPhoneNumber))
      ..add(DiagnosticsProperty('verifyCustomer', verifyCustomer))
      ..add(DiagnosticsProperty('getPayBillsCategory', getPayBillsCategory))
      ..add(DiagnosticsProperty('getPayBillsProduct', getPayBillsProduct))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('responsemessage', responsemessage))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('transactionPin', transactionPin));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaybillsInputData<T, S> &&
            (identical(other.service, service) ||
                const DeepCollectionEquality()
                    .equals(other.service, service)) &&
            (identical(other.product, product) ||
                const DeepCollectionEquality()
                    .equals(other.product, product)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.productCode, productCode) ||
                const DeepCollectionEquality()
                    .equals(other.productCode, productCode)) &&
            (identical(other.billcode, billcode) ||
                const DeepCollectionEquality()
                    .equals(other.billcode, billcode)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.smartcardormeterNo, smartcardormeterNo) ||
                const DeepCollectionEquality()
                    .equals(other.smartcardormeterNo, smartcardormeterNo)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.isRadioSelectedBillCategoryProvider, isRadioSelectedBillCategoryProvider) ||
                const DeepCollectionEquality().equals(
                    other.isRadioSelectedBillCategoryProvider,
                    isRadioSelectedBillCategoryProvider)) &&
            (identical(other.isRadioSelectedBillProductProvider, isRadioSelectedBillProductProvider) ||
                const DeepCollectionEquality().equals(
                    other.isRadioSelectedBillProductProvider,
                    isRadioSelectedBillProductProvider)) &&
            (identical(other.isRadioSelectedBillSubProductProvider, isRadioSelectedBillSubProductProvider) ||
                const DeepCollectionEquality().equals(
                    other.isRadioSelectedBillSubProductProvider,
                    isRadioSelectedBillSubProductProvider)) &&
            (identical(other.isRadioSelectedPhoneNumber, isRadioSelectedPhoneNumber) ||
                const DeepCollectionEquality().equals(
                    other.isRadioSelectedPhoneNumber,
                    isRadioSelectedPhoneNumber)) &&
            (identical(other.verifyCustomer, verifyCustomer) ||
                const DeepCollectionEquality()
                    .equals(other.verifyCustomer, verifyCustomer)) &&
            (identical(other.getPayBillsCategory, getPayBillsCategory) ||
                const DeepCollectionEquality()
                    .equals(other.getPayBillsCategory, getPayBillsCategory)) &&
            (identical(other.getPayBillsProduct, getPayBillsProduct) ||
                const DeepCollectionEquality()
                    .equals(other.getPayBillsProduct, getPayBillsProduct)) &&
            (identical(other.success, success) || const DeepCollectionEquality().equals(other.success, success)) &&
            (identical(other.error, error) || const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.responsemessage, responsemessage) || const DeepCollectionEquality().equals(other.responsemessage, responsemessage)) &&
            (identical(other.amount, amount) || const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.transactionPin, transactionPin) || const DeepCollectionEquality().equals(other.transactionPin, transactionPin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(service) ^
      const DeepCollectionEquality().hash(product) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(productCode) ^
      const DeepCollectionEquality().hash(billcode) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(smartcardormeterNo) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(isRadioSelectedBillCategoryProvider) ^
      const DeepCollectionEquality().hash(isRadioSelectedBillProductProvider) ^
      const DeepCollectionEquality()
          .hash(isRadioSelectedBillSubProductProvider) ^
      const DeepCollectionEquality().hash(isRadioSelectedPhoneNumber) ^
      const DeepCollectionEquality().hash(verifyCustomer) ^
      const DeepCollectionEquality().hash(getPayBillsCategory) ^
      const DeepCollectionEquality().hash(getPayBillsProduct) ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(responsemessage) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(transactionPin);

  @JsonKey(ignore: true)
  @override
  _$PaybillsInputDataCopyWith<T, S, _PaybillsInputData<T, S>> get copyWith =>
      __$PaybillsInputDataCopyWithImpl<T, S, _PaybillsInputData<T, S>>(
          this, _$identity);
}

abstract class _PaybillsInputData<T, S> implements PaybillsInputData<T, S> {
  factory _PaybillsInputData(
      {int service,
      String product,
      String phone,
      String categoryName,
      String productCode,
      String billcode,
      String name,
      String smartcardormeterNo,
      String categoryId,
      int isRadioSelectedBillCategoryProvider,
      int isRadioSelectedBillProductProvider,
      int isRadioSelectedBillSubProductProvider,
      int isRadioSelectedPhoneNumber,
      VerifyCustomer verifyCustomer,
      GetPayBills<T> getPayBillsCategory,
      GetPayBills<S> getPayBillsProduct,
      int success,
      int error,
      String responsemessage,
      double amount,
      String transactionPin}) = _$_PaybillsInputData<T, S>;

  @override
  int get service;
  @override
  String get product;
  @override
  String get phone;
  @override
  String get categoryName;
  @override
  String get productCode;
  @override
  String get billcode;
  @override
  String get name;
  @override
  String get smartcardormeterNo;
  @override
  String get categoryId;
  @override
  int get isRadioSelectedBillCategoryProvider;
  @override
  int get isRadioSelectedBillProductProvider;
  @override
  int get isRadioSelectedBillSubProductProvider;
  @override
  int get isRadioSelectedPhoneNumber;
  @override
  VerifyCustomer get verifyCustomer;
  @override
  GetPayBills<T> get getPayBillsCategory;
  @override
  GetPayBills<S> get getPayBillsProduct;
  @override
  int get success;
  @override
  int get error;
  @override
  String get responsemessage;
  @override
  double get amount;
  @override
  String get transactionPin;
  @override
  @JsonKey(ignore: true)
  _$PaybillsInputDataCopyWith<T, S, _PaybillsInputData<T, S>> get copyWith;
}
