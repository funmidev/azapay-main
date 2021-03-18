import 'dart:io';

import 'package:azapay/src/models/models.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/retrofit.dart';

part 'apiprovider.g.dart';

@RestApi(
  // baseUrl: 'https://staging.azapay.com.ng',
    baseUrl: 'https://azapayspring.oa.r.appspot.com',


)
// 'http://azapaybackenddev-env.eba-3j4mixtm.eu-central-1.elasticbeanstalk.com'
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  ///---------------OnBoarding------------

  @POST('/onboard/signup')
  Future<SignUp> signUp(@Body() CreateSignUp createSignUp);

  @GET('/onboard/otp/resend/{phonenumber}')
  Future<BasicResponse<String>> resendOtp(
      @Path('phonenumber') String phonenumber);

  @POST('/onboard/otp/verify')
  Future<BasicResponse<String>> verifyOtp(@Body() OtpVerify otpVerify);

  @PUT('/password/create')
  Future<BasicResponse<String>> createAccountPassword(
      @Body() CreateAccountPasword createAccountPasword);

  @PUT('/onboard/names')
  Future<BasicResponse<String>> createFullName(
      @Body() CreateAccountFullName createAccountFullName);

  @PUT('/onboard/tag/create')
  Future<BasicResponse<String>> createTag(@Body() CreateTag createTag);

  ///--------------Sign In----------------------

  @GET('/auth/extract/tag/from')
  Future<BasicResponse<String>> extractDeviceInfo(
      @Query('device') String device);

  @POST('/auth/signin')
  Future<BasicResponse<String>> signIn(@Body() SignIn signIn);

  @POST('/auth/validate/token')
  Future<BasicResponse<String>> validateToken(@Body() Token token);

  @GET('/password/acquire/verification/token/{azatag}')
  Future<AcquireResetToken> acquireResetToken(@Path('azatag') String azatag);

  @PUT('/password/reset')
  Future<BasicResponse<String>> modifyPassword(
      @Body() ModifyPassword modifyPassword);

  ///--------------Fund Transfer----------------

  @POST('/fund/make/request')
  Future<BasicResponse<Fund>> makeFundRequest(@Body() FundRequest fundRequest,
      {@CancelRequest() CancelToken cancelToken});

  @GET('/fund/cancel/request/{ref}')
  Future<BasicResponse<Fund>> cancelFundRequest(@Path('ref') String ref);

  @GET('/fund/list/request')
  Future<BasicResponse<List<Fund>>> listAllFundRequest();

  @POST('/fund/request/approve')
  Future<BasicResponse<Fund>> approveRequest(
      @Body() ApproveRequest approverequest);

  @GET('/fund/decline/request/{ref}')
  Future<BasicResponse<Fund>> declineRequest(@Path('ref') String ref);

  @POST('/fund/transfer/to/account')
  Future<BasicResponse<TransactionHistory>> transferToAccount(
      @Body() FundTransfer fundTransfer,
      {@CancelRequest() CancelToken cancelToken});

  @POST('/fund/transfer/through/id')
  Future<BasicResponse<FundTransferUser>> transferToUser(
      @Body() FundTransfer fundTransfer,
      {@CancelRequest() CancelToken cancelToken});

  // @POST('/fund/pay/merchant')
  // Future<> payToMerchant(@Body() FundTransfer fundTransfer )

  ///-------------------Wallet----------------------------

  @GET('/wallet/create')
  Future<Wallet> createWallet();

  @GET('/wallet/open')
  Future<Wallet> openWallet();

  @GET('/wallet/banks')
  Future<List<BankList>> retrieveBankList();

  @POST('/wallet/link/bank')
  Future<LinkBank> createLinkBankToWallet(
      @Body() LinkBankAccount linkBankAccount,
      {@CancelRequest() CancelToken cancelToken});

  @GET('/wallet/linked/banks')
  Future<LinkBank> retrieveLinkBankToWalletList();

  @GET('/wallet/account/enquiry')
  Future<AccountEquiry> retrieveAcquireEnquiry(
      @Query('account') String account, @Query('bankcode') String bankcode);

  // @POST('/wallet/withdraw/to/linked/bank')
  // Future<> withdrawToLinkBank(@Body() WithdrawLinkBank withDrawLinkBank);

  ///------------------------Transaction----------------------

  @GET('/transaction/search')
  Future<BasicResponse<TransactionHistory>> queryATransaction(
      @Query('ref') String ref);

  @GET('/transaction/history')
  Future<BasicResponse<List<TransactionHistory>>> retrieveTransactionHistory(
      @Query('bound') String bound);

//1888 8301 7098 5595

  ///----------------------Profile-----------------------------

  @GET('/user/profile')
  Future<SignUp> retrieveProfile();

  @GET('/merchant/profile')
  Future<SignUp> retrieveMerchantProfile();

  @PUT('/user/transaction/pin/modify')
  Future<BasicResponse<String>> setTransactionPin(
      @Body() TransactionPin transactionPin);

  @GET('/user/otp/send')
  Future<BasicResponse<String>> getTransactionPinToken();

  @PUT('/user/profile/modify/basic')
  Future<BasicResponse<Data>> modifyProfile(@Body() Data data);

  @PUT('/merchant/profile/modify/basic')
  Future<BasicResponse<Data>> modifyMerchantProfile(@Body() Data data);

  @GET('/user/bvn/validate/{bvn}')
  Future<BasicResponse<String>> validateBVN(@Path('bvn') String bvn);

  @GET('/user/bvn/valid')
  Future<BasicResponse<String>> checkBVNavalidationStatus();

  @PUT('/user/profile/modify/valid/doc')
  Future<BasicResponse<String>> modifyDocs(
      @Part(contentType: 'image/jpeg') File file);

  @PUT('/merchant/profile/modify/cac')
  Future<BasicResponse<String>> modifyMerchnatCAC(
      @Part(contentType: 'image/jpeg') File file);

  @GET('/user/profile/dp')
  Future<BasicResponse<String>> getprofilepic();

  @GET('/user/profile/valid/doc')
  Future<BasicResponse<String>> getdoc();

  @PUT('/user/profile/modify/dp')
  Future<BasicResponse<String>> modifyProfilePic(
      @Part(contentType: 'image/jpeg') File file);

  ///------------------------PayBills---------------------------

  ///---Airtime----------

  @GET('/airtime/products')
  Future<GetPayBills<String>> retrieveAirtime();

  @POST('/airtime/purchase')
  Future<BasicResponse<TransactionHistory>> purchaseAirtime(
      @Body() PayBill<double> payBill);

  ///---Data

  @GET('/data/category')
  Future<GetPayBills<GetPayBillsItem>> retrieveDataCategory();

  @GET('/data/products')
  Future<GetPayBills<GetPayBillsItem>> retrieveDataProduct();

  @POST('/data/purchase')
  Future<BasicResponse<TransactionHistory>> purchaseData(
      @Body() PayBill<double> payBill);

  ///---Cable

  @GET('/cable/products')
  Future<GetPayBills<GetPayBillsItem>> retrieveCableCategory();

  @GET('/cable/verify')
  Future<VerifyCustomer> verifyCableUser(
      @Query('billcode') String billcode, @Query('smartcard') String smartcard);

  @GET('/cable/products')
  Future<GetPayBills<GetPayBillsItem>> retrieveCableProductSelectedCategory(
      @Query('category_name') String category_name,
      @Query('smartcard') String smartcard);

  @POST('/cable/purchase')
  Future<BasicResponse<TransactionHistory>> purchaseCable(
      @Body() PayBill<double> payBill);

  ///---Electricity

  @GET('/electricity/products')
  Future<GetPayBills<GetPayBillsItem>> retrieveElectricityCategory();

  @GET('/electricity/verify')
  Future<VerifyCustomer> verifyElectricityUserMeter(
      @Query('billcode') String billcode, @Query('meter_no') String meter_no);

  @POST('/electricity/purchase')
  Future<BasicResponse<TransactionHistory>> purchaseElectricity(
      @Body() PayBill<double> payBill);

  //--------------Merchant Web-------------------------

  //--------------Merchant Mobile----------------------
  // @GET('/merchant/view')
  // Future<String> getMerchantList(@Query('tag') String tag);
}
