// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 5;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      email: fields[2] as String,
      phone: fields[3] as String,
      tag: fields[4] as String,
      gender: fields[5] as String,
      dateOfBirth: fields[6] as String,
      bvn: fields[7] as bool,
      address: fields[8] as String,
      state: fields[9] as String,
      uidAcceptanceStatus: fields[10] as bool,
      accountType: fields[11] as String,
      role: fields[12] as String,
      country: fields[13] as String,
      rc: fields[14] as String,
      businessAddress: fields[16] as String,
      businessName: fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.tag)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.dateOfBirth)
      ..writeByte(7)
      ..write(obj.bvn)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.uidAcceptanceStatus)
      ..writeByte(11)
      ..write(obj.accountType)
      ..writeByte(12)
      ..write(obj.role)
      ..writeByte(13)
      ..write(obj.country)
      ..writeByte(14)
      ..write(obj.rc)
      ..writeByte(15)
      ..write(obj.businessName)
      ..writeByte(16)
      ..write(obj.businessAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionHistoryAdapter extends TypeAdapter<TransactionHistory> {
  @override
  final int typeId = 7;

  @override
  TransactionHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionHistory(
      createdAt: fields[0] as String,
      modifiedAt: fields[1] as String,
      pair: fields[2] as Pair,
      ref: fields[3] as String,
      type: fields[4] as String,
      mode: fields[5] as String,
      amount: fields[6] as double,
      payerBalance: fields[7] as dynamic,
      charge: fields[8] as double,
      status: fields[9] as String,
      note: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionHistory obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.modifiedAt)
      ..writeByte(2)
      ..write(obj.pair)
      ..writeByte(3)
      ..write(obj.ref)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.mode)
      ..writeByte(6)
      ..write(obj.amount)
      ..writeByte(7)
      ..write(obj.payerBalance)
      ..writeByte(8)
      ..write(obj.charge)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PairAdapter extends TypeAdapter<Pair> {
  @override
  final int typeId = 8;

  @override
  Pair read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pair(
      from_key: fields[0] as String,
      to_key: fields[1] as String,
      from_type: fields[2] as String,
      to_type: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Pair obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.from_key)
      ..writeByte(1)
      ..write(obj.to_key)
      ..writeByte(2)
      ..write(obj.from_type)
      ..writeByte(3)
      ..write(obj.to_type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PairAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FundAdapter extends TypeAdapter<Fund> {
  @override
  final int typeId = 9;

  @override
  Fund read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fund(
      from: fields[0] as From,
      to: fields[1] as From,
      ref: fields[2] as String,
      amount: fields[3] as double,
      status: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Fund obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.from)
      ..writeByte(1)
      ..write(obj.to)
      ..writeByte(2)
      ..write(obj.ref)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FromAdapter extends TypeAdapter<From> {
  @override
  final int typeId = 12;

  @override
  From read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return From(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      email: fields[2] as String,
      phone: fields[3] as String,
      tag: fields[4] as String,
      gender: fields[5] as String,
      dateOfBirth: fields[6] as String,
      bvn: fields[7] as dynamic,
      address: fields[8] as String,
      state: fields[9] as String,
      country: fields[10] as String,
      uidAcceptanceStatus: fields[11] as bool,
      accountType: fields[12] as String,
      role: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, From obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.tag)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.dateOfBirth)
      ..writeByte(7)
      ..write(obj.bvn)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.state)
      ..writeByte(10)
      ..write(obj.country)
      ..writeByte(11)
      ..write(obj.uidAcceptanceStatus)
      ..writeByte(12)
      ..write(obj.accountType)
      ..writeByte(13)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FromAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BankListAdapter extends TypeAdapter<BankList> {
  @override
  final int typeId = 14;

  @override
  BankList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankList(
      bankname: fields[0] as String,
      bankcode: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BankList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.bankname)
      ..writeByte(1)
      ..write(obj.bankcode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RefFundAdapter extends TypeAdapter<RefFund> {
  @override
  final int typeId = 11;

  @override
  RefFund read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RefFund(
      ref: fields[0] as String,
      actionperformed: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RefFund obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.ref)
      ..writeByte(1)
      ..write(obj.actionperformed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RefFundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) {
  return SignUp(
    code: json['code'] as String,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    firstName: json['firstName'] as String ?? '',
    lastName: json['lastName'] as String ?? '',
    email: json['email'] as String ?? '',
    phone: json['phone'] as String ?? '',
    tag: json['tag'] as String ?? '',
    gender: json['gender'] as String ?? '',
    dateOfBirth: json['dateOfBirth'] as String ?? '',
    bvn: json['bvn'] as bool ?? '',
    address: json['address'] as String ?? '',
    state: json['state'] as String ?? '',
    uidAcceptanceStatus: json['uidAcceptanceStatus'] as bool ?? '',
    accountType: json['accountType'] as String ?? '',
    role: json['role'] as String ?? '',
    country: json['country'] as String ?? '',
    rc: json['rc'] as String ?? '',
    businessAddress: json['businessAddress'] as String ?? '',
    businessName: json['businessName'] as String ?? '',
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'tag': instance.tag,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'bvn': instance.bvn,
      'address': instance.address,
      'state': instance.state,
      'uidAcceptanceStatus': instance.uidAcceptanceStatus,
      'accountType': instance.accountType,
      'role': instance.role,
      'country': instance.country,
      'rc': instance.rc,
      'businessName': instance.businessName,
      'businessAddress': instance.businessAddress,
    };

BasicResponse<T> _$BasicResponseFromJson<T>(Map<String, dynamic> json) {
  return BasicResponse<T>(
    code: json['code'] as String,
    data: BasicResponseConverter<T>().fromJson(json['data']),
    accountType: json['accountType'] as String,
    message: json['message'] as String,
    status: json['status'] as int,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$BasicResponseToJson<T>(BasicResponse<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': BasicResponseConverter<T>().toJson(instance.data),
      'message': instance.message,
      'status': instance.status,
      'accountType': instance.accountType,
      'token': instance.token,
    };

FundTransferUser _$FundTransferUserFromJson(Map<String, dynamic> json) {
  return FundTransferUser(
    type: json['type'] as String,
    tnx: json['tnx'] == null
        ? null
        : TransactionHistory.fromJson(json['tnx'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FundTransferUserToJson(FundTransferUser instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tnx': instance.tnx,
    };

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return TransactionHistory(
    createdAt: json['createdAt'] as String,
    modifiedAt: json['modifiedAt'] as String,
    pair: json['pair'] == null
        ? null
        : Pair.fromJson(json['pair'] as Map<String, dynamic>),
    ref: json['ref'] as String,
    type: json['type'] as String,
    mode: json['mode'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    payerBalance: json['payerBalance'],
    charge: (json['charge'] as num)?.toDouble(),
    status: json['status'] as String,
    note: json['note'] as String,
  );
}

Map<String, dynamic> _$TransactionHistoryToJson(TransactionHistory instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
      'pair': instance.pair,
      'ref': instance.ref,
      'type': instance.type,
      'mode': instance.mode,
      'amount': instance.amount,
      'payerBalance': instance.payerBalance,
      'charge': instance.charge,
      'status': instance.status,
      'note': instance.note,
    };

Pair _$PairFromJson(Map<String, dynamic> json) {
  return Pair(
    from_key: json['from_key'] as String,
    to_key: json['to_key'] as String,
    from_type: json['from_type'] as String,
    to_type: json['to_type'] as String,
  );
}

Map<String, dynamic> _$PairToJson(Pair instance) => <String, dynamic>{
      'from_key': instance.from_key,
      'to_key': instance.to_key,
      'from_type': instance.from_type,
      'to_type': instance.to_type,
    };

AcquireResetToken _$AcquireResetTokenFromJson(Map<String, dynamic> json) {
  return AcquireResetToken(
    code: json['code'] as String,
    data: json['data'] == null
        ? null
        : ResetData.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$AcquireResetTokenToJson(AcquireResetToken instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Fund _$FundFromJson(Map<String, dynamic> json) {
  return Fund(
    from: json['from'] == null
        ? null
        : From.fromJson(json['from'] as Map<String, dynamic>),
    to: json['to'] == null
        ? null
        : From.fromJson(json['to'] as Map<String, dynamic>),
    ref: json['ref'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$FundToJson(Fund instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'ref': instance.ref,
      'amount': instance.amount,
      'status': instance.status,
    };

From _$FromFromJson(Map<String, dynamic> json) {
  return From(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    tag: json['tag'] as String,
    gender: json['gender'] as String,
    dateOfBirth: json['dateOfBirth'] as String,
    bvn: json['bvn'],
    address: json['address'] as String,
    state: json['state'] as String,
    country: json['country'] as String,
    uidAcceptanceStatus: json['uidAcceptanceStatus'] as bool,
    accountType: json['accountType'] as String,
    role: json['role'] as String,
  );
}

Map<String, dynamic> _$FromToJson(From instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'tag': instance.tag,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'bvn': instance.bvn,
      'address': instance.address,
      'state': instance.state,
      'country': instance.country,
      'uidAcceptanceStatus': instance.uidAcceptanceStatus,
      'accountType': instance.accountType,
      'role': instance.role,
    };

ResetData _$ResetDataFromJson(Map<String, dynamic> json) {
  return ResetData(
    phone: json['phone'] as String,
    verificationToken: json['verificationToken'] as String,
  );
}

Map<String, dynamic> _$ResetDataToJson(ResetData instance) => <String, dynamic>{
      'phone': instance.phone,
      'verificationToken': instance.verificationToken,
    };

LinkBank _$LinkBankFromJson(Map<String, dynamic> json) {
  return LinkBank(
    code: json['code'] as String,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Bank.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$LinkBankToJson(LinkBank instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return Wallet(
    code: json['code'] as String,
    data: json['data'] == null
        ? null
        : WalletData.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

WalletData _$WalletDataFromJson(Map<String, dynamic> json) {
  return WalletData(
    createdAt: json['createdAt'] as String,
    modifiedAt: json['modifiedAt'] as String,
    bank: (json['bank'] as List)
        ?.map(
            (e) => e == null ? null : Bank.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    key: json['key'] as String,
    name: json['name'] as String,
    balance: (json['balance'] as num)?.toDouble(),
    ledgerBalance: (json['ledgerBalance'] as num)?.toDouble(),
    lastAuditedAt: json['lastAuditedAt'] as String,
  );
}

Map<String, dynamic> _$WalletDataToJson(WalletData instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
      'bank': instance.bank,
      'key': instance.key,
      'name': instance.name,
      'balance': instance.balance,
      'ledgerBalance': instance.ledgerBalance,
      'lastAuditedAt': instance.lastAuditedAt,
    };

Bank _$BankFromJson(Map<String, dynamic> json) {
  return Bank(
    createdAt: json['createdAt'] as String,
    modifiedAt: json['modifiedAt'] as String,
    accountName: json['accountName'] as String,
    accountNo: json['accountNo'] as String,
    accountType: json['accountType'] as String,
    bankName: json['bankName'] as String,
    bankCode: json['bankCode'] as String,
  );
}

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'modifiedAt': instance.modifiedAt,
      'accountName': instance.accountName,
      'accountNo': instance.accountNo,
      'accountType': instance.accountType,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
    };

BankList _$BankListFromJson(Map<String, dynamic> json) {
  return BankList(
    bankname: json['bankname'] as String,
    bankcode: json['bankcode'] as String,
  );
}

Map<String, dynamic> _$BankListToJson(BankList instance) => <String, dynamic>{
      'bankname': instance.bankname,
      'bankcode': instance.bankcode,
    };

AccountEquiry _$AccountEquiryFromJson(Map<String, dynamic> json) {
  return AccountEquiry(
    code: json['code'] as String,
    data: json['data'] == null
        ? null
        : EquiryData.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$AccountEquiryToJson(AccountEquiry instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

EquiryData _$EquiryDataFromJson(Map<String, dynamic> json) {
  return EquiryData(
    name: json['name'] as String,
    number: json['number'] as String,
    type: json['type'],
    balance: (json['balance'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EquiryDataToJson(EquiryData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'type': instance.type,
      'balance': instance.balance,
    };

GetPayBills<T> _$GetPayBillsFromJson<T>(Map<String, dynamic> json) {
  return GetPayBills<T>(
    code: json['code'] as String,
    data:
        (json['data'] as List)?.map(PayBillConverter<T>().fromJson)?.toList() ??
            [],
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$GetPayBillsToJson<T>(GetPayBills<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data?.map(PayBillConverter<T>().toJson)?.toList(),
      'message': instance.message,
      'status': instance.status,
    };

GetPayBillsItem _$GetPayBillsItemFromJson(Map<String, dynamic> json) {
  return GetPayBillsItem(
    categoryName: json['categoryName'] as String,
    categoryId: json['categoryId'] as String,
    price: (json['price'] as num)?.toDouble(),
    productcode: json['productcode'] as String ?? '',
    qty: json['qty'] as String,
    label: json['label'] as String ?? '',
    products: (json['products'] as List)
            ?.map((e) => e == null
                ? null
                : TelecomProduct.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    name: json['name'] as String,
    product: json['product'] as String,
    billcode: json['billcode'] as String,
  );
}

Map<String, dynamic> _$GetPayBillsItemToJson(GetPayBillsItem instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'productcode': instance.productcode,
      'label': instance.label,
      'products': instance.products,
      'qty': instance.qty,
      'name': instance.name,
      'product': instance.product,
      'price': instance.price,
      'billcode': instance.billcode,
    };

VerifyCustomer _$VerifyCustomerFromJson(Map<String, dynamic> json) {
  return VerifyCustomer(
    code: json['code'] as String,
    data: json['data'] == null
        ? null
        : VerifyCustomerData.fromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$VerifyCustomerToJson(VerifyCustomer instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'status': instance.status,
    };

VerifyCustomerData _$VerifyCustomerDataFromJson(Map<String, dynamic> json) {
  return VerifyCustomerData(
    name: json['name'] as String,
    accountNumber: json['accountNumber'] as String,
    customerNumber: json['customerNumber'] as String,
    address: json['address'] as String,
    meterNo: json['meterNo'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$VerifyCustomerDataToJson(VerifyCustomerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'accountNumber': instance.accountNumber,
      'customerNumber': instance.customerNumber,
      'status': instance.status,
      'address': instance.address,
      'meterNo': instance.meterNo,
    };

TelecomProduct _$TelecomProductFromJson(Map<String, dynamic> json) {
  return TelecomProduct(
    amount: (json['amount'] as num)?.toDouble() ?? 0.0,
    code: json['code'] as String ?? '',
    fee: (json['fee'] as num)?.toDouble() ?? 0.0,
    name: json['name'] as String ?? '',
    maximum: (json['maximum'] as num)?.toDouble(),
    minimum: (json['minimum'] as num)?.toDouble(),
    exactAmount: json['exactAmount'] as bool,
  );
}

Map<String, dynamic> _$TelecomProductToJson(TelecomProduct instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'code': instance.code,
      'fee': instance.fee,
      'name': instance.name,
      'maximum': instance.maximum,
      'minimum': instance.minimum,
      'exactAmount': instance.exactAmount,
    };
