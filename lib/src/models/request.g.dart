// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignInAdapter extends TypeAdapter<SignIn> {
  @override
  final int typeId = 0;

  @override
  SignIn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignIn(
      tag: fields[0] as String,
      password: fields[1] as String,
      device: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SignIn obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.tag)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.device);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionPinAdapter extends TypeAdapter<TransactionPin> {
  @override
  final int typeId = 4;

  @override
  TransactionPin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionPin(
      pin: fields[0] as String,
      verificationToken: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionPin obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pin)
      ..writeByte(1)
      ..write(obj.verificationToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionPinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSignUp _$CreateSignUpFromJson(Map<String, dynamic> json) {
  return CreateSignUp(
    email: json['email'] as String,
    phone: json['phone'] as String,
    role: json['role'] as String,
  );
}

Map<String, dynamic> _$CreateSignUpToJson(CreateSignUp instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
    };

OtpVerify _$OtpVerifyFromJson(Map<String, dynamic> json) {
  return OtpVerify(
    token: json['token'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$OtpVerifyToJson(OtpVerify instance) => <String, dynamic>{
      'token': instance.token,
      'phone': instance.phone,
    };

CreateAccountPasword _$CreateAccountPaswordFromJson(Map<String, dynamic> json) {
  return CreateAccountPasword(
    json['confirmPassword'] as String,
    password: json['password'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$CreateAccountPaswordToJson(
        CreateAccountPasword instance) =>
    <String, dynamic>{
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'phone': instance.phone,
    };

CreateAccountFullName _$CreateAccountFullNameFromJson(
    Map<String, dynamic> json) {
  return CreateAccountFullName(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$CreateAccountFullNameToJson(
        CreateAccountFullName instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
    };

CreateTag _$CreateTagFromJson(Map<String, dynamic> json) {
  return CreateTag(
    tag: json['tag'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$CreateTagToJson(CreateTag instance) => <String, dynamic>{
      'tag': instance.tag,
      'phone': instance.phone,
    };

SignIn _$SignInFromJson(Map<String, dynamic> json) {
  return SignIn(
    tag: json['tag'] as String,
    password: json['password'] as String,
    device: json['device'] as String,
  );
}

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'tag': instance.tag,
      'password': instance.password,
      'device': instance.device,
    };

ModifyPassword _$ModifyPasswordFromJson(Map<String, dynamic> json) {
  return ModifyPassword(
    password: json['password'] as String,
    verificationToken: json['verificationToken'] as String,
  );
}

Map<String, dynamic> _$ModifyPasswordToJson(ModifyPassword instance) =>
    <String, dynamic>{
      'password': instance.password,
      'verificationToken': instance.verificationToken,
    };

LinkBankAccount _$LinkBankAccountFromJson(Map<String, dynamic> json) {
  return LinkBankAccount(
    accountName: json['accountName'] as String,
    accountNo: json['accountNo'] as String,
    accountType: json['accountType'] as String,
    bankName: json['bankName'] as String,
    bankCode: json['bankCode'] as String,
  );
}

Map<String, dynamic> _$LinkBankAccountToJson(LinkBankAccount instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'accountNo': instance.accountNo,
      'accountType': instance.accountType,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
    };

WithdrawToLinkBank _$WithdrawToLinkBankFromJson(Map<String, dynamic> json) {
  return WithdrawToLinkBank(
    linkedBankAccountNo: json['linkedBankAccountNo'] as String,
    amount: json['amount'] as int,
    transactionPin: json['transactionPin'] as String,
  );
}

Map<String, dynamic> _$WithdrawToLinkBankToJson(WithdrawToLinkBank instance) =>
    <String, dynamic>{
      'linkedBankAccountNo': instance.linkedBankAccountNo,
      'amount': instance.amount,
      'transactionPin': instance.transactionPin,
    };

FundRequest _$FundRequestFromJson(Map<String, dynamic> json) {
  return FundRequest(
    amount: (json['amount'] as num).toDouble(),
    to: json['to'] as String,
  );
}

Map<String, dynamic> _$FundRequestToJson(FundRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'to': instance.to,
    };

ApproveRequest _$ApproveRequestFromJson(Map<String, dynamic> json) {
  return ApproveRequest(
    ref: json['ref'] as String,
    transactionPin: json['transactionPin'] as String,
  );
}

Map<String, dynamic> _$ApproveRequestToJson(ApproveRequest instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'transactionPin': instance.transactionPin,
    };

FundTransfer _$FundTransferFromJson(Map<String, dynamic> json) {
  return FundTransfer(
    account: json['account'] as String,
    userId: json['userId'] as String,
    bankName: json['bankName'] as String,
    bankCode: json['bankCode'] as String,
    amount: (json['amount'] as num).toDouble(),
    walletKey: json['walletKey'] as String,
    transactionPin: json['transactionPin'] as String,
    note: json['note'] as String,
  );
}

Map<String, dynamic> _$FundTransferToJson(FundTransfer instance) =>
    <String, dynamic>{
      'account': instance.account,
      'userId': instance.userId,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'amount': instance.amount,
      'walletKey': instance.walletKey,
      'transactionPin': instance.transactionPin,
      'note': instance.note,
    };

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token(
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
    };

TransactionPin _$TransactionPinFromJson(Map<String, dynamic> json) {
  return TransactionPin(
    pin: json['pin'] as String,
    verificationToken: json['verificationToken'] as String,
  );
}

Map<String, dynamic> _$TransactionPinToJson(TransactionPin instance) =>
    <String, dynamic>{
      'pin': instance.pin,
      'verificationToken': instance.verificationToken,
    };

_$_PayBill<T> _$_$_PayBillFromJson<T>(Map<String, dynamic> json) {
  return _$_PayBill<T>(
    product: json['product'] as String,
    phone: json['phone'] as String,
    categoryName: json['categoryName'] as String,
    billCode: json['billCode'] as String,
    productCode: json['productCode'] as String,
    name: json['name'] as String,
    smartcard: json['smartcard'] as String,
    categoryId: json['categoryId'] as String,
    meterNo: json['meterNo'] as String,
    accountName: json['accountName'] as String,
    telco: json['telco'] as String,
    amount: PayBillConverter<T>().fromJson(json['amount']),
    transactionPin: json['transactionPin'] as String,
  );
}

Map<String, dynamic> _$_$_PayBillToJson<T>(_$_PayBill<T> instance) =>
    <String, dynamic>{
      'product': instance.product,
      'phone': instance.phone,
      'categoryName': instance.categoryName,
      'billCode': instance.billCode,
      'productCode': instance.productCode,
      'name': instance.name,
      'smartcard': instance.smartcard,
      'categoryId': instance.categoryId,
      'meterNo': instance.meterNo,
      'accountName': instance.accountName,
      'telco': instance.telco,
      'amount': PayBillConverter<T>().toJson(instance.amount),
      'transactionPin': instance.transactionPin,
    };
