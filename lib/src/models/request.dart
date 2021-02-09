import 'package:azapay/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';

part 'request.g.dart';
part 'request.freezed.dart';

@JsonSerializable(nullable: false)
class CreateSignUp {
  final String email;
  final String phone;
  final String role;

  CreateSignUp({this.email, this.phone, this.role});

  factory CreateSignUp.fromJson(Map<String, dynamic> json) => _$CreateSignUpFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSignUpToJson(this);
}

@JsonSerializable(nullable: false)
class OtpVerify {
  final String token;
  final String phone;

  OtpVerify({this.token, this.phone});

  factory OtpVerify.fromJson(Map<String, dynamic> json) => _$OtpVerifyFromJson(json);

  Map<String, dynamic> toJson() => _$OtpVerifyToJson(this);
}

@JsonSerializable(nullable: false)
class CreateAccountPasword {
  final String password;
  final String phone;

  CreateAccountPasword({this.password, this.phone});

  factory CreateAccountPasword.fromJson(Map<String, dynamic> json) => _$CreateAccountPaswordFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountPaswordToJson(this);
}

@JsonSerializable(nullable: false)
class CreateAccountFullName {
  final String firstName;
  final String lastName;
  final String phone;

  CreateAccountFullName({this.firstName, this.lastName, this.phone});

  factory CreateAccountFullName.fromJson(Map<String, dynamic> json) => _$CreateAccountFullNameFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAccountFullNameToJson(this);
}

@JsonSerializable(nullable: false)
class CreateTag {
  final String tag;
  final String phone;

  CreateTag({this.tag, this.phone});

  factory CreateTag.fromJson(Map<String, dynamic> json) => _$CreateTagFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTagToJson(this);
}

@HiveType(typeId: 0)
@JsonSerializable(nullable: false)
class SignIn {
  @HiveField(0)
  final String tag;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String device;

  SignIn({this.tag, this.password, this.device});

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  Map<String, dynamic> toJson() => _$SignInToJson(this);
}

@JsonSerializable(nullable: false)
class ModifyPassword {
  final String password;
  final String verificationToken;

  ModifyPassword({this.password, this.verificationToken});

  factory ModifyPassword.fromJson(Map<String, dynamic> json) => _$ModifyPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$ModifyPasswordToJson(this);
}

///---------------Wallet ,Transfer,Request------------------///

@JsonSerializable(nullable: false)
class LinkBankAccount {
  LinkBankAccount({
    this.accountName,
    this.accountNo,
    this.accountType,
    this.bankName,
    this.bankCode,
  });

  final String accountName;
  final String accountNo;
  final String accountType;
  final String bankName;
  final String bankCode;

  factory LinkBankAccount.fromJson(Map<String, dynamic> json) => _$LinkBankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$LinkBankAccountToJson(this);
}

@JsonSerializable(nullable: false)
class WithdrawToLinkBank {
  WithdrawToLinkBank({
    this.linkedBankAccountNo,
    this.amount,
    this.transactionPin,
  });

  final String linkedBankAccountNo;
  final int amount;
  final String transactionPin;

  factory WithdrawToLinkBank.fromJson(Map<String, dynamic> json) => _$WithdrawToLinkBankFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawToLinkBankToJson(this);
}

@JsonSerializable(nullable: false)
class FundRequest {
  FundRequest({
    this.amount,
    this.to,
  });

  final double amount;
  final String to;

  factory FundRequest.fromJson(Map<String, dynamic> json) => _$FundRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FundRequestToJson(this);
}

@JsonSerializable(nullable: false)
class ApproveRequest {
  ApproveRequest({
    this.ref,
    this.transactionPin,
  });

  final String ref;
  final String transactionPin;

  factory ApproveRequest.fromJson(Map<String, dynamic> json) => _$ApproveRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ApproveRequestToJson(this);
}

@JsonSerializable(nullable: false)
class FundTransfer {
  FundTransfer({
    this.account,
    this.userId,
    this.bankName,
    this.bankCode,
    this.amount,
    this.walletKey,
    this.transactionPin,
    this.note,
  });

  final String account;
  final String userId;
  final String bankName;
  final String bankCode;
  final double amount;
  final String walletKey;
  final String transactionPin;
  final String note;

  factory FundTransfer.fromJson(Map<String, dynamic> json) => _$FundTransferFromJson(json);

  Map<String, dynamic> toJson() => _$FundTransferToJson(this);
}

@JsonSerializable(nullable: false)
class Token {
  final String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable(nullable: false)
class TransactionPin {
  @HiveField(0)
  final String pin;
  @HiveField(1)
  final String verificationToken;

  TransactionPin({this.pin, this.verificationToken});

  factory TransactionPin.fromJson(Map<String, dynamic> json) => _$TransactionPinFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionPinToJson(this);
}

@freezed
abstract class PayBill<T> with _$PayBill<T> {
  factory PayBill({
    String product,
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
    String transactionPin,
  }) = _PayBill;

  factory PayBill.fromJson(Map<String, dynamic> json) => _$PayBillFromJson(json);

  // Map<String, dynamic> toJson() => _$PayBillToJson(this);
}
