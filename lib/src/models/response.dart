import 'package:azapay/app/app.dart';
import 'package:azapay/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'response.g.dart';

@JsonSerializable()
class SignUp {
  const SignUp({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  final String code;
  final Data data;
  final String message;
  final int status;

  factory SignUp.fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpToJson(this);
}

@HiveType(typeId: 5)
@JsonSerializable()
class Data {
  const Data(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.tag,
      this.gender,
      this.dateOfBirth,
      this.bvn,
      this.address,
      this.state,
      this.uidAcceptanceStatus,
      this.accountType,
      this.role,
      this.country,
      this.rc,
      this.businessAddress,
      this.businessName});

  @HiveField(0)
  @JsonKey(defaultValue: AppStrings.empty)
  final String firstName;
  @HiveField(1)
  @JsonKey(defaultValue: AppStrings.empty)
  final String lastName;
  @HiveField(2)
  @JsonKey(defaultValue: AppStrings.empty)
  final String email;
  @HiveField(3)
  @JsonKey(defaultValue: AppStrings.empty)
  final String phone;
  @HiveField(4)
  @JsonKey(defaultValue: AppStrings.empty)
  final String tag;
  @HiveField(5)
  @JsonKey(defaultValue: AppStrings.empty)
  final String gender;
  @HiveField(6)
  @JsonKey(defaultValue: AppStrings.empty)
  final String dateOfBirth;
  @HiveField(7)
  @JsonKey(defaultValue: AppStrings.empty)
  final bool bvn;
  @HiveField(8)
  @JsonKey(defaultValue: AppStrings.empty)
  final String address;
  @HiveField(9)
  @JsonKey(defaultValue: AppStrings.empty)
  final String state;
  @HiveField(10)
  @JsonKey(defaultValue: AppStrings.empty)
  final bool uidAcceptanceStatus;
  @HiveField(11)
  @JsonKey(defaultValue: AppStrings.empty)
  final String accountType;
  @HiveField(12)
  @JsonKey(defaultValue: AppStrings.empty)
  final String role;
  @HiveField(13)
  @JsonKey(defaultValue: AppStrings.empty)
  final String country;
  @HiveField(14)
  @JsonKey(defaultValue: AppStrings.empty)
  final String rc;
  @HiveField(15)
  @JsonKey(defaultValue: AppStrings.empty)
  final String businessName;
  @HiveField(16)
  @JsonKey(defaultValue: AppStrings.empty)
  final String businessAddress;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

//Merchant List Item
// @JsonSerializable(nullable: true)
// class GetMerchantResponse<T> {
//
//   final String code;
//   final String data;
//   final int status;
//
//   const GetMerchantResponse(
//       {this.code,
//       this.data,
//       this.status});
//
//
//   factory GetMerchantResponse.fromJson(Map<String, dynamic> json) =>
//       _$GetMerchantFromJson(json);
//
//   Map<String, dynamic> toJson() => _$MerchantResponseToJson(this);
// }

@JsonSerializable(nullable: true)
@HiveType(typeId: 9)
class BasicResponse<T> {
  //otpresend
  //otpverify
  //set account paswword
  //set account full name
  //Tag creation

  //signin
  //validate token
  // modify password

  final String code;
  @BasicResponseConverter()
  final T data;
  final String message;
  final int status;
  final String accountType;
  final String token;

  const BasicResponse(
      {this.code,
      this.data,
      this.accountType,
      this.message,
      this.status,
      this.token});

  // factory BasicResponse<T>.initial({int status}) {
  // return BasicResponse<T>(status: status);

  factory BasicResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BasicResponseToJson(this);
}

@JsonSerializable(nullable: true)
class FundTransferUser {
  FundTransferUser({
    this.type,
    this.tnx,
  });

  final String type;
  final TransactionHistory tnx;

  factory FundTransferUser.fromJson(Map<String, dynamic> json) =>
      _$FundTransferUserFromJson(json);

  Map<String, dynamic> toJson() => _$FundTransferUserToJson(this);
}

@HiveType(typeId: 7)
@JsonSerializable(nullable: true)
class TransactionHistory {
  @HiveField(0)
  final String createdAt;
  @HiveField(1)
  final String modifiedAt;
  @HiveField(2)
  final Pair pair;
  @HiveField(3)
  final String ref;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final String mode;
  @HiveField(6)
  final double amount;
  @HiveField(7)
  final dynamic payerBalance;
  @HiveField(8)
  final double charge;
  @HiveField(9)
  final String status;
  @HiveField(10)
  final String note;

  const TransactionHistory({
    this.createdAt,
    this.modifiedAt,
    this.pair,
    this.ref,
    this.type,
    this.mode,
    this.amount,
    this.payerBalance,
    this.charge,
    this.status,
    this.note,
  });

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionHistoryToJson(this);
}

@HiveType(typeId: 8)
@JsonSerializable(nullable: true)
class Pair {
  @HiveField(0)
  final String from_key;
  @HiveField(1)
  final String to_key;
  @HiveField(2)
  final String from_type;
  @HiveField(3)
  final String to_type;

  const Pair({
    this.from_key,
    this.to_key,
    this.from_type,
    this.to_type,
  });

  factory Pair.fromJson(Map<String, dynamic> json) => _$PairFromJson(json);
  Map<String, dynamic> toJson() => _$PairToJson(this);
}

@JsonSerializable(nullable: true)
class AcquireResetToken {
  final String code;
  final ResetData data;
  final String message;
  final int status;

  const AcquireResetToken({this.code, this.data, this.message, this.status});

  factory AcquireResetToken.fromJson(Map<String, dynamic> json) =>
      _$AcquireResetTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AcquireResetTokenToJson(this);
}

@JsonSerializable(nullable: true)
@HiveType(typeId: 9)
class Fund {
  const Fund({
    this.from,
    this.to,
    this.ref,
    this.amount,
    this.status,
  });
  @HiveField(0)
  final From from;
  @HiveField(1)
  final From to;
  @HiveField(2)
  final String ref;
  @HiveField(3)
  final double amount;
  @HiveField(4)
  final String status;

  factory Fund.fromJson(Map<String, dynamic> json) => _$FundFromJson(json);

  Map<String, dynamic> toJson() => _$FundToJson(this);
}

@JsonSerializable(nullable: true)
@HiveType(typeId: 12)
class From {
  const From({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.tag,
    this.gender,
    this.dateOfBirth,
    this.bvn,
    this.address,
    this.state,
    this.country,
    this.uidAcceptanceStatus,
    this.accountType,
    this.role,
  });
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String tag;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final String dateOfBirth;
  @HiveField(7)
  final dynamic bvn;
  @HiveField(8)
  final String address;
  @HiveField(9)
  final String state;
  @HiveField(10)
  final String country;
  @HiveField(11)
  final bool uidAcceptanceStatus;
  @HiveField(12)
  final String accountType;
  @HiveField(13)
  final String role;

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}

@JsonSerializable(nullable: true)
class ResetData {
  final String phone;
  final String verificationToken;

  ResetData({this.phone, this.verificationToken});

  factory ResetData.fromJson(Map<String, dynamic> json) =>
      _$ResetDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResetDataToJson(this);
}

@JsonSerializable(nullable: true)
class LinkBank {
  const LinkBank({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  final String code;
  final List<Bank> data;
  final String message;
  final int status;

  factory LinkBank.fromJson(Map<String, dynamic> json) =>
      _$LinkBankFromJson(json);

  Map<String, dynamic> toJson() => _$LinkBankToJson(this);
}

@JsonSerializable(nullable: true)
class Wallet {
  //Create Wallet
  ///Open Wallet

  const Wallet({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  final String code;
  final WalletData data;
  final String message;
  final int status;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}

@JsonSerializable(nullable: true)
class WalletData {
  WalletData(
      {this.createdAt,
      this.modifiedAt,
      this.bank,
      this.key,
      this.name,
      this.balance,
      this.ledgerBalance,
      this.lastAuditedAt});

  final String createdAt;
  final String modifiedAt;
  final List<Bank> bank;
  final String key;
  final String name;
  final double balance;
  final double ledgerBalance;
  final String lastAuditedAt;

  factory WalletData.fromJson(Map<String, dynamic> json) =>
      _$WalletDataFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDataToJson(this);
}

@JsonSerializable(nullable: true)
class Bank {
  Bank({
    this.createdAt,
    this.modifiedAt,
    this.accountName,
    this.accountNo,
    this.accountType,
    this.bankName,
    this.bankCode,
  });

  final String createdAt;
  final String modifiedAt;
  final String accountName;
  final String accountNo;
  final String accountType;
  final String bankName;
  final String bankCode;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);
}

@HiveType(typeId: 14)
@JsonSerializable(nullable: true)
class BankList {
  //Todo: This returns a list of bank
  BankList({
    this.bankname,
    this.bankcode,
  });

  @HiveField(0)
  final String bankname;
  @HiveField(1)
  final String bankcode;

  factory BankList.fromJson(Map<String, dynamic> json) =>
      _$BankListFromJson(json);

  Map<String, dynamic> toJson() => _$BankListToJson(this);
}

@JsonSerializable()
class AccountEquiry {
  AccountEquiry({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  final String code;
  final EquiryData data;
  final String message;
  final int status;

  factory AccountEquiry.fromJson(Map<String, dynamic> json) =>
      _$AccountEquiryFromJson(json);

  Map<String, dynamic> toJson() => _$AccountEquiryToJson(this);
}

@JsonSerializable()
class EquiryData {
  EquiryData({
    this.name,
    this.number,
    this.type,
    this.balance,
  });

  final String name;
  final String number;
  final dynamic type;
  final double balance;

  factory EquiryData.fromJson(Map<String, dynamic> json) =>
      _$EquiryDataFromJson(json);

  Map<String, dynamic> toJson() => _$EquiryDataToJson(this);
}

@JsonSerializable()
class GetPayBills<T> {
  const GetPayBills({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  final String code;
  @PayBillConverter()
  @JsonKey(defaultValue: [])
  final List<T> data;
  final String message;
  final int status;

  factory GetPayBills.fromJson(Map<String, dynamic> json) =>
      _$GetPayBillsFromJson(json);

  Map<String, dynamic> toJson() => _$GetPayBillsToJson(this);
}

@JsonSerializable()
class GetPayBillsItem {
  GetPayBillsItem({
    this.categoryName,
    this.categoryId,
    this.price,
    this.productcode,
    this.qty,
    this.label,
    this.products,
    this.name,
    this.product,
    this.billcode,
  });

  final String categoryName;
  final String categoryId;
  // final double amount;
  @JsonKey(defaultValue: AppStrings.empty)
  final String productcode;
  @JsonKey(defaultValue: AppStrings.empty)
  final String label;
  @JsonKey(defaultValue: [])
  final List<TelecomProduct> products;
  final String qty;
  final String name;
  final String product;
  final double price;
  final String billcode;

  factory GetPayBillsItem.fromJson(Map<String, dynamic> json) =>
      _$GetPayBillsItemFromJson(json);

  Map<String, dynamic> toJson() => _$GetPayBillsItemToJson(this);
}

@JsonSerializable()
class VerifyCustomer {
  const VerifyCustomer({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  final String code;
  final VerifyCustomerData data;
  final String message;
  final int status;

  factory VerifyCustomer.fromJson(Map<String, dynamic> json) =>
      _$VerifyCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCustomerToJson(this);
}

@JsonSerializable()
class VerifyCustomerData {
  const VerifyCustomerData({
    this.name,
    this.accountNumber,
    this.customerNumber,
    this.address,
    this.meterNo,
    this.status,
  });

  final String name;
  final String accountNumber;
  final String customerNumber;
  final String status;
  final String address;
  final String meterNo;

  factory VerifyCustomerData.fromJson(Map<String, dynamic> json) =>
      _$VerifyCustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCustomerDataToJson(this);
}

@HiveType(typeId: 11)
class RefFund {
  @HiveField(0)
  final String ref;
  @HiveField(1)
  final bool actionperformed;
  RefFund({this.ref, this.actionperformed});
}

// @JsonSerializable()
// class TelecomData {
//   TelecomData({
//     this.label,
//     this.products,
//   });

//   factory TelecomData.fromJson(Map<String, dynamic> json) => _$TelecomDataFromJson(json);

//   Map<String, dynamic> toJson() => _$TelecomDataToJson(this);
// }
// }
@JsonSerializable()
class TelecomProduct {
  TelecomProduct({
    this.amount,
    this.code,
    this.fee,
    this.name,
    this.maximum,
    this.minimum,
    this.exactAmount,
  });
  @JsonKey(defaultValue: 0.0)
  final double amount;
  @JsonKey(defaultValue: AppStrings.empty)
  final String code;
  @JsonKey(defaultValue: 0.0)
  final double fee;
  @JsonKey(defaultValue: AppStrings.empty)
  final String name;
  final double maximum;
  final double minimum;
  final bool exactAmount;

  factory TelecomProduct.fromJson(Map<String, dynamic> json) =>
      _$TelecomProductFromJson(json);

  Map<String, dynamic> toJson() => _$TelecomProductToJson(this);
}

//next typeid 12
