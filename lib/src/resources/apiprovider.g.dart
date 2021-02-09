// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiprovider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiProvider implements ApiProvider {
  _ApiProvider(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://staging.azapay.com.ng';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<SignUp> signUp(createSignUp) async {
    ArgumentError.checkNotNull(createSignUp, 'createSignUp');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createSignUp?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/onboard/signup',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SignUp.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> resendOtp(phonenumber) async {
    ArgumentError.checkNotNull(phonenumber, 'phonenumber');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/onboard/otp/resend/$phonenumber',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> verifyOtp(otpVerify) async {
    ArgumentError.checkNotNull(otpVerify, 'otpVerify');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(otpVerify?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/onboard/otp/verify',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> createAccountPassword(
      createAccountPasword) async {
    ArgumentError.checkNotNull(createAccountPasword, 'createAccountPasword');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createAccountPasword?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/password/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> createFullName(createAccountFullName) async {
    ArgumentError.checkNotNull(createAccountFullName, 'createAccountFullName');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createAccountFullName?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/onboard/names',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> createTag(createTag) async {
    ArgumentError.checkNotNull(createTag, 'createTag');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createTag?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/onboard/tag/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> extractDeviceInfo(device) async {
    ArgumentError.checkNotNull(device, 'device');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'device': device};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/auth/extract/tag/from',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> signIn(signIn) async {
    ArgumentError.checkNotNull(signIn, 'signIn');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(signIn?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/auth/signin',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> validateToken(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(token?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/auth/validate/token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<AcquireResetToken> acquireResetToken(azatag) async {
    ArgumentError.checkNotNull(azatag, 'azatag');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/password/acquire/verification/token/$azatag',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AcquireResetToken.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> modifyPassword(modifyPassword) async {
    ArgumentError.checkNotNull(modifyPassword, 'modifyPassword');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(modifyPassword?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/password/reset',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<Fund>> makeFundRequest(fundRequest,
      {cancelToken}) async {
    ArgumentError.checkNotNull(fundRequest, 'fundRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(fundRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/fund/make/request',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = BasicResponse<Fund>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<Fund>> cancelFundRequest(ref) async {
    ArgumentError.checkNotNull(ref, 'ref');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/fund/cancel/request/$ref',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<Fund>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<List<Fund>>> listAllFundRequest() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/fund/list/request',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<List<Fund>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<Fund>> approveRequest(approverequest) async {
    ArgumentError.checkNotNull(approverequest, 'approverequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(approverequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/fund/request/approve',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<Fund>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<Fund>> declineRequest(ref) async {
    ArgumentError.checkNotNull(ref, 'ref');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/fund/decline/request/$ref',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<Fund>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<TransactionHistory>> transferToAccount(fundTransfer,
      {cancelToken}) async {
    ArgumentError.checkNotNull(fundTransfer, 'fundTransfer');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(fundTransfer?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/fund/transfer/to/account',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = BasicResponse<TransactionHistory>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<FundTransferUser>> transferToUser(fundTransfer,
      {cancelToken}) async {
    ArgumentError.checkNotNull(fundTransfer, 'fundTransfer');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(fundTransfer?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/fund/transfer/through/id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = BasicResponse<FundTransferUser>.fromJson(_result.data);
    return value;
  }

  @override
  Future<Wallet> createWallet() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/wallet/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Wallet.fromJson(_result.data);
    return value;
  }

  @override
  Future<Wallet> openWallet() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/wallet/open',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Wallet.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<BankList>> retrieveBankList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/wallet/banks',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => BankList.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<LinkBank> createLinkBankToWallet(linkBankAccount,
      {cancelToken}) async {
    ArgumentError.checkNotNull(linkBankAccount, 'linkBankAccount');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(linkBankAccount?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/wallet/link/bank',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data,
        cancelToken: cancelToken);
    final value = LinkBank.fromJson(_result.data);
    return value;
  }

  @override
  Future<LinkBank> retrieveLinkBankToWalletList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/wallet/linked/banks',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LinkBank.fromJson(_result.data);
    return value;
  }

  @override
  Future<AccountEquiry> retrieveAcquireEnquiry(account, bankcode) async {
    ArgumentError.checkNotNull(account, 'account');
    ArgumentError.checkNotNull(bankcode, 'bankcode');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'account': account,
      r'bankcode': bankcode
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/wallet/account/enquiry',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AccountEquiry.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<TransactionHistory>> queryATransaction(ref) async {
    ArgumentError.checkNotNull(ref, 'ref');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'ref': ref};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/transaction/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<TransactionHistory>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<List<TransactionHistory>>> retrieveTransactionHistory(
      bound) async {
    ArgumentError.checkNotNull(bound, 'bound');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'bound': bound};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/transaction/history',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value =
        BasicResponse<List<TransactionHistory>>.fromJson(_result.data);
    return value;
  }

  @override
  Future<SignUp> retrieveProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user/profile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SignUp.fromJson(_result.data);
    return value;
  }

  @override
  Future<SignUp> retrieveMerchantProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/merchant/profile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SignUp.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> setTransactionPin(transactionPin) async {
    ArgumentError.checkNotNull(transactionPin, 'transactionPin');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transactionPin?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/transaction/pin/modify',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> getTransactionPinToken() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user/otp/send',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<Data>> modifyProfile(data) async {
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/profile/modify/basic',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<Data>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<Data>> modifyMerchantProfile(data) async {
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/merchant/profile/modify/basic',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<Data>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> validateBVN(bvn) async {
    ArgumentError.checkNotNull(bvn, 'bvn');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/bvn/validate/$bvn',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> checkBVNavalidationStatus() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user/bvn/valid',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> modifyDocs(file) async {
    ArgumentError.checkNotNull(file, 'file');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last,
            contentType: MediaType.parse('image/jpeg'))));
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/profile/modify/valid/doc',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> modifyMerchnatCAC(file) async {
    ArgumentError.checkNotNull(file, 'file');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last,
            contentType: MediaType.parse('image/jpeg'))));
    final _result = await _dio.request<Map<String, dynamic>>(
        '/merchant/profile/modify/cac',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> getprofilepic() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user/profile/dp',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> getdoc() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/profile/valid/doc',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<String>> modifyProfilePic(file) async {
    ArgumentError.checkNotNull(file, 'file');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last,
            contentType: MediaType.parse('image/jpeg'))));
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user/profile/modify/dp',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetPayBills<String>> retrieveAirtime() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/airtime/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetPayBills<String>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<TransactionHistory>> purchaseAirtime(payBill) async {
    ArgumentError.checkNotNull(payBill, 'payBill');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(payBill?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/airtime/purchase',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<TransactionHistory>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetPayBills<GetPayBillsItem>> retrieveDataCategory() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/data/category',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetPayBills<GetPayBillsItem>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetPayBills<GetPayBillsItem>> retrieveDataProduct() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/data/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetPayBills<GetPayBillsItem>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<TransactionHistory>> purchaseData(payBill) async {
    ArgumentError.checkNotNull(payBill, 'payBill');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(payBill?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/data/purchase',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<TransactionHistory>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetPayBills<GetPayBillsItem>> retrieveCableCategory() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/cable/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetPayBills<GetPayBillsItem>.fromJson(_result.data);
    return value;
  }

  @override
  Future<VerifyCustomer> verifyCableUser(billcode, smartcard) async {
    ArgumentError.checkNotNull(billcode, 'billcode');
    ArgumentError.checkNotNull(smartcard, 'smartcard');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'billcode': billcode,
      r'smartcard': smartcard
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/cable/verify',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VerifyCustomer.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetPayBills<GetPayBillsItem>> retrieveCableProductSelectedCategory(
      category_name, smartcard) async {
    ArgumentError.checkNotNull(category_name, 'category_name');
    ArgumentError.checkNotNull(smartcard, 'smartcard');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category_name': category_name,
      r'smartcard': smartcard
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/cable/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetPayBills<GetPayBillsItem>.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<TransactionHistory>> purchaseCable(payBill) async {
    ArgumentError.checkNotNull(payBill, 'payBill');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(payBill?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/cable/purchase',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<TransactionHistory>.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetPayBills<GetPayBillsItem>> retrieveElectricityCategory() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/electricity/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetPayBills<GetPayBillsItem>.fromJson(_result.data);
    return value;
  }

  @override
  Future<VerifyCustomer> verifyElectricityUserMeter(billcode, meter_no) async {
    ArgumentError.checkNotNull(billcode, 'billcode');
    ArgumentError.checkNotNull(meter_no, 'meter_no');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'billcode': billcode,
      r'meter_no': meter_no
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/electricity/verify',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VerifyCustomer.fromJson(_result.data);
    return value;
  }

  @override
  Future<BasicResponse<TransactionHistory>> purchaseElectricity(payBill) async {
    ArgumentError.checkNotNull(payBill, 'payBill');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(payBill?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/electricity/purchase',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BasicResponse<TransactionHistory>.fromJson(_result.data);
    return value;
  }

  // @override
  // Future<String> getMerchantList(String tag) async{
  //   ArgumentError.checkNotNull(tag, 'tag');
  //   const _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{
  //     r'tag': tag
  //   };
  //   final _data = <String, dynamic>{};
  //   final _result = await _dio.request<Map<String, dynamic>>(
  //       '/merchant/view',
  //       queryParameters: queryParameters,
  //       options: RequestOptions(
  //           method: 'GET',
  //           headers: <String, dynamic>{},
  //           extra: _extra,
  //           baseUrl: baseUrl),
  //       data: _data);
  //   final value = GetMerchantResponse.fromJson(_result);
  //   return value;
  // }

}
