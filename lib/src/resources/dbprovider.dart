import 'dart:io';
import 'dart:typed_data';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DatabaseProvider {
  Future<void> initializedb() async {
    await Hive.initFlutter();
    HydratedBloc.storage = await HydratedStorage.build();

    Hive
      ..registerAdapter<SignIn>(SignInAdapter())
      ..registerAdapter<BasicResponse<String>>(BasicResponseAdapter<String>(typeId: 1))
      ..registerAdapter<Contacts>(ContactsAdapter())
      ..registerAdapter<TransactionPin>(TransactionPinAdapter())
      ..registerAdapter<TransactionHistory>(TransactionHistoryAdapter())
      ..registerAdapter<Pair>(PairAdapter())
      ..registerAdapter<Data>(DataAdapter())
      ..registerAdapter<DeviceContacts>(DeviceContactsAdapter())
      ..registerAdapter<Fund>(FundAdapter())
      ..registerAdapter<From>(FromAdapter())
      ..registerAdapter<FreshChat>(FreshChatAdapter())
      ..registerAdapter<RefFund>(RefFundAdapter())
      ..registerAdapter<BankList>(BankListAdapter());

    await Hive.openBox<BasicResponse<String>>(AppStrings.tokenBoxName);
    await Hive.openBox<SignIn>(AppStrings.signinBoxName);
    await Hive.openBox<BasicResponse<String>>(AppStrings.switchaccountBoxName);
    await Hive.openBox<bool>(AppStrings.navigationBoxName);
    await Hive.openBox<Contacts>(AppStrings.recentContactBoxName);
    await Hive.openBox<TransactionPin>(AppStrings.transactionPinBoxName);
    await Hive.openBox<Data>(AppStrings.personalDataBoxName);
    await Hive.openBox<DeviceContacts>(AppStrings.deviceContactBoxName);
    await Hive.openBox<bool>(AppStrings.settingsBoxName);
    await Hive.openBox<RefFund>(AppStrings.fundRequestClickedBoxName);
    await Hive.openBox<FreshChat>(AppStrings.freshchatRestoreIDBoxName);
    await Hive.openBox<Uint8List>(AppStrings.cacheImagesBoxName);
    await Hive.openBox<Fund>(AppStrings.fundRequestBoxName);
    await Hive.openBox<BankList>(AppStrings.banksBoxName);
  }

  Uint8List getcacheFilename({int index}) {
    return Hive.box<Uint8List>(AppStrings.cacheImagesBoxName).get(index);
  }

  Future<void> storecacheFilename({int index, Uint8List picturebyte}) async {
    await Hive.box<Uint8List>(AppStrings.cacheImagesBoxName).put(index, picturebyte);
  }

  Future<void> deletecacheFilename() async {
    await Hive.box<Uint8List>(AppStrings.cacheImagesBoxName).clear();
  }

  bool getSettings({int position}) {
    return Hive.box<bool>(AppStrings.settingsBoxName).get(position);
  }

  Future<void> addSettings({bool value, int position}) async {
    await Hive.box<bool>(AppStrings.settingsBoxName).put(position, value);
  }

  Data retrievePersonalData() {
    return Hive.box<Data>(AppStrings.personalDataBoxName).get(0);
  }

  Future<void> addPersonalData({Data personalData}) async {
    await Hive.box<Data>(AppStrings.personalDataBoxName).put(0, personalData);
  }

  Future<void> deletePersonalData() async {
    await Hive.box<Data>(AppStrings.personalDataBoxName).clear();
  }

  //todo: store token (add/update Note: only one item)
  Future<void> addToken({BasicResponse<String> basicResponse}) async {
    await Hive.box<BasicResponse<String>>(AppStrings.tokenBoxName).put(0, basicResponse);
  }

  BasicResponse retrieveToken() {
    return Hive.box<BasicResponse<String>>(AppStrings.tokenBoxName).get(0);
  }

  Future<void> deleteToken() async {
    await Hive.box<BasicResponse<String>>(AppStrings.tokenBoxName).clear();
  }

  //todo: store user signin details (add/retrieve)
  Future<void> addAzapayUser({SignIn signIn}) async {
    await Hive.box<SignIn>(AppStrings.signinBoxName).put(0, signIn);
  }

  SignIn retrieveAzapayUser() {
    return Hive.box<SignIn>(AppStrings.signinBoxName).get(0);
  }

  Future<void> deleteAzapayUser() async {
    await Hive.box<SignIn>(AppStrings.signinBoxName).clear();
  }

  bool getnavigation() {
    return Hive.box<bool>(AppStrings.navigationBoxName).get(0) ?? false;
  }

  Future<void> addnavigation() async {
    //true -for -if the user has entered home screen
    //false  for - if the user has not
    await Hive.box<bool>(AppStrings.navigationBoxName).put(0, true);
  }

  Future<void> deletenavigation() async {
    //true -for -if the user has entered home screen
    //false  for - if the user has not
    await Hive.box<bool>(AppStrings.navigationBoxName).clear();
  }

  Future<void> addrecentContacts({Contacts contacts}) async {
    final recentBox = Hive.box<Contacts>(AppStrings.recentContactBoxName);
    if (recentBox.isEmpty) {
      await recentBox.add(contacts);
    } else if (recentBox.values.every((client) => client.client != contacts.client)) {
      await recentBox.add(contacts);
    }
  }

  Future<void> deleterecentContacts() async {
    await Hive.box<Contacts>(AppStrings.recentContactBoxName).clear();
  }

  List<Contacts> retrieveRecentContacts() {
    return Hive.box<Contacts>(AppStrings.recentContactBoxName).values.toList();
  }

  Future<void> setTransactionPin({TransactionPin transactionPin}) async {
    await Hive.box<TransactionPin>(AppStrings.transactionPinBoxName).put(0, transactionPin);
  }

  Future<void> deleteTransactionPin() async {
    await Hive.box<TransactionPin>(AppStrings.transactionPinBoxName).clear();
  }

  TransactionPin retrievePin() {
    return Hive.box<TransactionPin>(AppStrings.transactionPinBoxName).get(0);
  }

  List<DeviceContacts> retrieveDeviceContacts() {
    return Hive.box<DeviceContacts>(AppStrings.deviceContactBoxName).values.toList();
  }

  Future<void> addDeviceContacts({List<Contact> devicecontacts}) async {
    for (var contact in devicecontacts) {
      await Hive.box<DeviceContacts>(AppStrings.deviceContactBoxName).add(DeviceContacts(
          title: contact.displayName,
          number: contact.phones.toList().isNotEmpty
              ? contact.phones.toList().elementAt(0).value.isEmpty
                  ? contact.phones.toList().elementAt(1).value
                  : contact.phones.toList().elementAt(0).value
              : AppStrings.empty));
    }
  }

  Future<void> addfundRequest({List<Fund> funds}) async {
    final fundRequestBox = Hive.box<Fund>(AppStrings.fundRequestBoxName);
    if (fundRequestBox.isEmpty) {
      for (final fund in funds) {
        await fundRequestBox.add(fund);
        await Hive.box<RefFund>(AppStrings.fundRequestClickedBoxName)
            .put(fund.ref, RefFund(actionperformed: false, ref: fund.ref));
      }
    } else {
      await fundRequestBox.clear();
      for (final fund in funds) {
        await fundRequestBox.add(fund);
        await Hive.box<RefFund>(AppStrings.fundRequestClickedBoxName)
            .put(fund.ref, RefFund(actionperformed: false, ref: fund.ref));
      }
      //     await fundRequestBox.add(fund);
      // await Hive.box<RefFund>(AppStrings.fundRequestClickedBoxName)
      //     .put(fund.ref, RefFund(actionperformed: false, ref: fund.ref));

      //     for(final fund in funds){
      // await fundRequestBox.delete(fund.ref);
      // await fundRequestBox.add(fund);
      // await Hive.box<RefFund>(AppStrings.fundRequestClickedBoxName)
      //     .put(fund.ref, RefFund(actionperformed: false, ref: fund.ref));
    }
  }

  List<Fund> retrieveFundRequest() {
    return Hive.box<Fund>(AppStrings.fundRequestBoxName).values.toList();
  }

  Future<void> updateRefIfActionPerformed({String ref, bool actionperformed}) async {
    await Hive.box<RefFund>(AppStrings.fundRequestClickedBoxName)
        .put(ref, RefFund(ref: ref, actionperformed: actionperformed));
  }

  List<RefFund> retrieveUpdatedRefActionPerformed() {
    return Hive.box<RefFund>(AppStrings.fundRequestClickedBoxName).values.toList();
  }

  Future<void> addfreshcharestoreId({String restoreId}) async {
    await Hive.box<FreshChat>(AppStrings.freshchatRestoreIDBoxName).put(
      0,
      FreshChat(
        restoreId: restoreId,
      ),
    );
  }

  FreshChat retrieveFreshchatRestoreId() {
    return Hive.box<FreshChat>(AppStrings.freshchatRestoreIDBoxName).get(0);
  }

  Future<void> addBanks({List<BankList> bankList}) async {
    for (var banks in bankList) {
      await Hive.box<BankList>(AppStrings.banksBoxName).add(banks);
    }
  }

  List<BankList> retrieveBanks() {
    return Hive.box<BankList>(AppStrings.banksBoxName).values.toList();
  }

  //switch account
  Future<void> addSwitchAzapayUser({BasicResponse<String> switchaccount}) async {
    await Hive.box<BasicResponse<String>>(AppStrings.switchaccountBoxName).put(0, switchaccount);
  }

  BasicResponse<String> retrieveSwitchAzapayUser() {
    return Hive.box<BasicResponse<String>>(AppStrings.switchaccountBoxName).get(0);
  }

  Future<void> deleteSwitchAzapayUser() async {
    await Hive.box<BasicResponse<String>>(AppStrings.switchaccountBoxName).clear();
  }
}
