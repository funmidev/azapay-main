import 'dart:convert';
import 'dart:io';

import 'package:azapay/Constants.dart';
import 'package:azapay/src/models/get_user_info_resp.dart';
import 'package:azapay/src/models/merchant_data.dart';
import 'package:azapay/src/models/pay_merchant.dart';
import 'package:azapay/src/models/pay_merchant_resp.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<MerchantResponse> getAllMerchant(
      String merchantTag, String token) async {
    var url = Constants.baseUrl(true) + '/merchant/view?tag=' + merchantTag;
    print('MerchantToken $token');
    final response = await http
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    try {
      if (response.statusCode == 200) {
        print("success" + response.body.toString());
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        var data = MerchantResponse.fromJson(json.decode(response.body));
        return data;
      } else {
        print(response.headers.toString());
        print(response.request.toString());
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

  static Future<GetUserInfoResp> getUserProfile(String token) async {
    var url = Constants.baseUrl(true) + '/user/profile';
    final response = await http
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    try {
      if (response.statusCode == 200) {
        print("successGetUser" + response.body.toString());
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        var data = GetUserInfoResp.fromJson(json.decode(response.body));
        return data;
      } else {
        print(response.headers.toString());
        print(response.request.toString());
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

  static Future<PayMerchantResp> payMerchant(
      PayMerchantParams payMerchantParams, String token) async {
    var url = Constants.baseUrl(true) + '/fund/pay/merchant';
    print('PayMerchant $token');
    final response = await http.post(
      url,
      body: json.encode(payMerchantParams),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    );

    try {
      if (response.statusCode == 200) {
        print("success66" + response.headers.toString());
        print("success65" + response.request.toString());
        print("success67" + response.body.toString());
        var data = PayMerchantResp.fromJson(json.decode(response.body));
        return data;
      } else {
        print("success66" + response.headers.toString());
        print("success65" + response.request.toString());
        print("success64" + response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }
}
