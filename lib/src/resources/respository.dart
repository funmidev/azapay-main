import 'dart:io';
import 'dart:typed_data';

import 'package:azapay/src/models/models.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';

import 'resources.dart';

class Repository {
  final dio = Dio(BaseOptions(connectTimeout: 10000, receiveTimeout: 10000)); // Provide a dio instance
  final _deviceInfo = DeviceInfo();
  final _dbprovider = DatabaseProvider();
  // final Repository repository;
  //todo: recieve token from hive db
  ApiProvider _apiProvider() {
    dio.interceptors.add(
      Fresh<String>(
        tokenHeader: (token) {
          // print(token);
          return token != null
              ? {
                  HttpHeaders.authorizationHeader: 'Bearer ${token}',
                  // 'Access-Control-Allow-Headers': 'Content-Type',
                  // 'Access-Control-Allow-Origin': 'https://staging.azapay.com.ng',
                  // 'Access-Control-Allow-Methods': 'POST,GET,DELETE,PUT,OPTIONS'
                }
              : <String, String>{};
        },
        tokenStorage: InMemoryTokenHiveStorage(),
        refreshToken: (token, client) async {
          final response = await ApiProvider(dio).signIn(
            SignIn(
              tag: _dbprovider.retrieveAzapayUser().tag,
              password: _dbprovider.retrieveAzapayUser().password,
              device: _dbprovider.retrieveAzapayUser().device,
            ),
          );
          // await _dbprovider.addToken(basicResponse: response);
          return response.token;
        },
        httpClient: dio,
      ),
    );
    // ..add(InterceptorsWrapper(onError: (error) {
    //   if (error.type == DioErrorType.CONNECT_TIMEOUT ||
    //       error.error is SocketException ||
    //       error.type == DioErrorType.DEFAULT) {
    //     final options = error?.request;
    //     print(options.path);
    //     return dio.request(options.path,
    //         options: options,
    //         queryParameters: options.queryParameters ?? <String, dynamic>{},
    //         data: options.data ?? <String, dynamic>{});
    //   }
    //   return error;
    // }));
    return ApiProvider(dio);
  }

  Future<String> getDeviceId() {
    return _deviceInfo.getImei();
  }

  bool getSettings({int position}) {
    return _dbprovider.getSettings(position: position);
  }

  Future<void> addSettings({bool value, int position}) async {
    await _dbprovider.addSettings(value: value, position: position);
  }

  BasicResponse<String> retrieveToken() {
    return _dbprovider.retrieveToken();
  }

  Future<void> deleteToken() async {
    await _dbprovider.deleteToken();
  }

  Future<void> addToken({BasicResponse<String> basicResponse}) async {
    await _dbprovider.addToken(basicResponse: basicResponse);
  }

  SignIn retrieveAzapayUser() {
    return _dbprovider.retrieveAzapayUser();
  }

  Future<void> addAzapayUser({SignIn signIn}) async {
    await _dbprovider.addAzapayUser(signIn: signIn);
  }

  bool getnavigation() {
    return _dbprovider.getnavigation();
  }

  Future<void> addnavigation() {
    return _dbprovider.addnavigation();
  }

  Future<void> addRecentContacts({Contacts contacts}) async {
    await _dbprovider.addrecentContacts(contacts: contacts);
  }

  List<Contacts> retrieveRecentContacts() {
    return _dbprovider.retrieveRecentContacts();
  }

  Future<void> addDeviceContacts({List<Contact> contacts}) async {
    await _dbprovider.addDeviceContacts(devicecontacts: contacts);
  }

  List<DeviceContacts> retrieveDeviceContacts() {
    return _dbprovider.retrieveDeviceContacts();
  }

  Future<void> setTransactionPin({TransactionPin transactionPin}) async {
    await _dbprovider.setTransactionPin(transactionPin: transactionPin);
  }

  Future<BasicResponse<String>> getTransactionPinToken() {
    return _apiProvider().getTransactionPinToken();
  }

  Future<BasicResponse<String>> setTransactionPinOnApi({TransactionPin transactionPin}) {
    return _apiProvider().setTransactionPin(transactionPin);
  }

  TransactionPin retrievePin() {
    return _dbprovider.retrievePin();
  }

  Future<SignUp> createSign({CreateSignUp createSignUp}) {
    print(createSignUp.email + createSignUp.phone);
    return _apiProvider().signUp(createSignUp);
  }

  Future<BasicResponse<String>> resendOtp({String phonenumber}) {
    return _apiProvider().resendOtp(phonenumber);
  }

  Future<BasicResponse<String>> validateBVN({String bvn}) {
    return _apiProvider().validateBVN(bvn);
  }

  Future<BasicResponse<String>> checkBVNavalidationStatus() {
    return _apiProvider().checkBVNavalidationStatus();
  }

  Future<BasicResponse<String>> modifyDocs({File file}) {
    return _apiProvider().modifyDocs(file);
  }

  Future<BasicResponse<String>> modifyProfilePic({File file}) {
    return _apiProvider().modifyProfilePic(file);
  }

  Future<BasicResponse<String>> getprofilepic() {
    return _apiProvider().getprofilepic();
  }

  Future<BasicResponse<String>> getdoc() {
    return _apiProvider().getdoc();
  }

  Future<BasicResponse<String>> verifyOtp({OtpVerify otpVerify}) {
    return _apiProvider().verifyOtp(otpVerify);
  }

  Future<BasicResponse<String>> createAccountPassword({CreateAccountPasword createAccountPasword}) {
    return _apiProvider().createAccountPassword(createAccountPasword);
  }

  Future<BasicResponse<String>> createFullName({CreateAccountFullName createAccountFullName}) {
    return _apiProvider().createFullName(createAccountFullName);
  }

  Future<BasicResponse<String>> createTag({CreateTag createTag}) {
    return _apiProvider().createTag(createTag);
  }

  Future<BasicResponse<String>> extractDeviceInfo({String device}) {
    return _apiProvider().extractDeviceInfo(device);
  }

  Future<BasicResponse<String>> signIn({SignIn signIn}) {
    return _apiProvider().signIn(signIn);
  }

  Future<BasicResponse<String>> validateToken({Token token}) {
    return _apiProvider().validateToken(token);
  }

  Future<AcquireResetToken> acquireResetToken({String azaTag}) {
    return _apiProvider().acquireResetToken(azaTag);
  }

  Future<BasicResponse<String>> modifyPassword({ModifyPassword modifyPassword}) {
    return _apiProvider().modifyPassword(modifyPassword);
  }

  Future<Wallet> createWallet() {
    return _apiProvider().createWallet();
  }

  Future<Wallet> openWallet() {
    return _apiProvider().openWallet();
  }

  Future<List<BankList>> retrieveBankList() {
    return _apiProvider().retrieveBankList();
  }

  Future<LinkBank> createLinkBankToWallet({LinkBankAccount linkBankAccount}) {
    return _apiProvider().createLinkBankToWallet(linkBankAccount);
  }

  Future<LinkBank> retrieveLinkBankToWalletList() {
    return _apiProvider().retrieveLinkBankToWalletList();
  }

  Future<AccountEquiry> retrieveAcquireEnquiry({String account, String bankcode}) {
    return _apiProvider().retrieveAcquireEnquiry(account, bankcode);
  }

  Future<SignUp> retrieveProfile() {
    return _apiProvider().retrieveProfile();
  }

  Data retrievePersonalData() {
    return _dbprovider.retrievePersonalData();
  }

  Future<void> addPersonalData({Data personalData}) async {
    await _dbprovider.addPersonalData(personalData: personalData);
  }

  Future<BasicResponse<Fund>> makeFundRequest({FundRequest fundRequest, CancelToken cancelToken}) {
    return _apiProvider().makeFundRequest(fundRequest, cancelToken: cancelToken);
  }

  Future<BasicResponse<Fund>> cancelFundRequest({String ref}) {
    return _apiProvider().cancelFundRequest(ref);
  }

  Future<BasicResponse<List<Fund>>> listAllFundRequest() {
    return _apiProvider().listAllFundRequest();
  }

  Future<BasicResponse<Fund>> approveRequest({ApproveRequest approverequest}) {
    return _apiProvider().approveRequest(approverequest);
  }

  Future<BasicResponse<Fund>> declineRequest({String ref}) {
    return _apiProvider().declineRequest(ref);
  }

  Future<BasicResponse<TransactionHistory>> transferToAccount({FundTransfer fundTransfer, CancelToken cancelToken}) {
    return _apiProvider().transferToAccount(fundTransfer, cancelToken: cancelToken);
  }

  Future<BasicResponse<FundTransferUser>> transferToUser({FundTransfer fundTransfer, CancelToken cancelToken}) {
    return _apiProvider().transferToUser(fundTransfer, cancelToken: cancelToken);
  }

//    Future<> payToMerchant({FundTransfer fundTransfer}) {
//     return _apiProvider().payToMerchant(fundTransfer);
//   }

  Future<BasicResponse<TransactionHistory>> queryATransaction({String ref}) {
    return _apiProvider().queryATransaction(ref);
  }

  Future<BasicResponse<List<TransactionHistory>>> retrieveTransactionHistory({String bound}) {
    return _apiProvider().retrieveTransactionHistory(bound);
  }

  Future<GetPayBills<String>> retrieveAirtime() {
    return _apiProvider().retrieveAirtime();
  }

  Future<BasicResponse<TransactionHistory>> purchaseAirtime({PayBill<double> payBill}) {
    return _apiProvider().purchaseAirtime(payBill);
  }

  Future<GetPayBills<GetPayBillsItem>> retrieveDataCategory() {
    return _apiProvider().retrieveDataCategory();
  }

  Future<GetPayBills<GetPayBillsItem>> retrieveDataProduct() {
    return _apiProvider().retrieveDataProduct();
  }

  Future<BasicResponse<TransactionHistory>> purchaseData({PayBill<double> payBill}) {
    return _apiProvider().purchaseData(payBill);
  }

  Future<GetPayBills<GetPayBillsItem>> retrieveCableCategory() {
    return _apiProvider().retrieveCableCategory();
  }

  Future<VerifyCustomer> verifyCableUser({String billcode, String smartcard}) {
    return _apiProvider().verifyCableUser(billcode, smartcard);
  }

  Future<GetPayBills<GetPayBillsItem>> retrieveCableProductSelectedCategory({String category_name, String smartcard}) {
    return _apiProvider().retrieveCableProductSelectedCategory(category_name, smartcard);
  }

  Future<BasicResponse<TransactionHistory>> purchaseCable({PayBill<double> payBill}) {
    return _apiProvider().purchaseCable(payBill);
  }

  Future<GetPayBills<GetPayBillsItem>> retrieveElectricityCategory() {
    return _apiProvider().retrieveElectricityCategory();
  }

  Future<VerifyCustomer> verifyElectricityUserMeter({String billcode, String meter_no}) {
    return _apiProvider().verifyElectricityUserMeter(billcode, meter_no);
  }

  Future<BasicResponse<TransactionHistory>> purchaseElectricity({PayBill<double> payBill}) {
    return _apiProvider().purchaseElectricity(payBill);
  }

  Future<void> deleteAzapayUser() async {
    await _dbprovider.deleteAzapayUser();
  }

  Future<void> deletenavigation() async {
    await _dbprovider.deletenavigation();
  }

  Future<void> deleterecentContacts() async {
    await _dbprovider.deleterecentContacts();
  }

  Future<void> deleteTransactionPin() async {
    await _dbprovider.deleteTransactionPin();
  }

  Future<void> addfundRequest({List<Fund> funds}) async {
    await _dbprovider.addfundRequest(funds: funds);
  }

  List<Fund> retrieveFundRequest() {
    return _dbprovider.retrieveFundRequest();
  }

  Future<void> updateRefIfActionPerformed({String ref, bool actionperformed}) async {
    await _dbprovider.updateRefIfActionPerformed(ref: ref, actionperformed: actionperformed);
  }

  List<RefFund> retrieveUpdatedRefActionPerformed() {
    return _dbprovider.retrieveUpdatedRefActionPerformed();
  }

  Future<BasicResponse<Data>> modifyProfile({Data data}) {
    return _apiProvider().modifyProfile(data);
  }

  FreshChat retrieveFreshchatRestoreId() {
    return _dbprovider.retrieveFreshchatRestoreId();
  }

  Future<void> addfreshcharestoreId({String restoreID}) {
    return _dbprovider.addfreshcharestoreId(restoreId: restoreID);
  }

  Uint8List getcacheFilename({int index}) {
    return _dbprovider.getcacheFilename(index: index);
  }

  Future<void> storecacheFilename({int index, Uint8List picturebyte}) async {
    await _dbprovider.storecacheFilename(index: index, picturebyte: picturebyte);
  }

  Future<void> addBanks({List<BankList> bankList}) async {
    return _dbprovider.addBanks(bankList: bankList);
  }

  List<BankList> retrieveBanks() {
    return _dbprovider.retrieveBanks();
  }

  Future<void> deletecacheFilename() async {
    await _dbprovider.deletecacheFilename();
  }

  Future<void> deletePersonalData() async {
    await _dbprovider.deletePersonalData();
  }

  Future<SignUp> retrieveMerchantProfile() {
    return _apiProvider().retrieveMerchantProfile();
  }

  Future<BasicResponse<Data>> modifyMerchantProfile({Data data}) {
    return _apiProvider().modifyMerchantProfile(data);
  }

  Future<BasicResponse<String>> modifyMerchnatCAC({File file}) {
    return _apiProvider().modifyMerchnatCAC(file);
  }

  //switch account
  BasicResponse<String> retrieveSwitchAzapayUser() {
    return _dbprovider.retrieveSwitchAzapayUser();
  }

  Future<void> addSwitchAzapayUser({BasicResponse<String> switchaccount}) async {
    await _dbprovider.addSwitchAzapayUser(switchaccount: switchaccount);
  }

  Future<void> deleteSwitchAzapayUser() async {
    await _dbprovider.deleteSwitchAzapayUser();
  }
}
