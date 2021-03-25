import 'dart:convert';
import 'dart:io';

import 'package:azapay/Constants.dart';
import 'package:azapay/service/azaAgent_info.dart';
import 'package:azapay/service/get_aza_agent_info.dart';
import 'package:azapay/service/pay_agant.dart';
import 'package:azapay/src/models/agent_info.dart';
import 'package:azapay/src/models/base_resp.dart';
import 'package:azapay/src/models/get_user_info_resp.dart';
import 'package:azapay/src/models/merchant_data.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/models/pay_merchant.dart';
import 'package:azapay/src/models/pay_merchant_resp.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/saveBeneficiary/model/save_beneficiary_model.dart';
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


  ///---GET ALL SAVE BENEFICIARY---
  static Future<SaveBeneficiaryModel> getAllSaveBeneficiary(
      String agentTag, String token) async {
    var url = Constants.baseUrl(true) + '/wallet/linked/agents';
    print('AgentToken $token');
    final response = await http
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    try {
      if (response.statusCode == 200) {
        print('success' + response.body.toString());
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        var data = SaveBeneficiaryModel.fromJson(json.decode(response.body));
        return data;
      } else {
        print('success' + response.body.toString());
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


//---getAllagent---

  static Future<AgentModelData> getAllAgent(
      String agentTag, String token) async {
    var url = Constants.baseUrl(true) + '/agent/view?tag=' + agentTag;
    print('AgentToken $token');
    final response = await http
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    try {
      if (response.statusCode == 200) {
        print('success' + response.body.toString());
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        var data = AgentModelData.fromJson(json.decode(response.body));
        return data;
      } else {
        print('success' + response.body.toString());
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

  //agent/view

  static Future<AgentModel> getAgents(String agentTag, String token) async {
    var url = Constants.baseUrl(true) + '/agent/view?tag=' + agentTag;
    print('AgentToken $token');
    final response = await http
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    try {
      if (response.statusCode == 200) {
        print('success' + response.body.toString());
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        var data = AgentModel.fromJson(json.decode(response.body));
        return data;
      } else {
        print('success' + response.body.toString());
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


  ///----get wallet-------
  static Future<Wallet> getWalletDetails(String token) async {
    var url = Constants.baseUrl(true) + '/wallet/open';
    print('AgentToken $token');
    final response = await http
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    try {
      if (response.statusCode == 200) {
        print('success' + response.body.toString());
        var data = Wallet.fromJson(json.decode(response.body));
        print('success' + data.message.toString());
        return data;
      } else {
        print('success' + response.body.toString());
        print(response.headers.toString());
        print(response.request.toString());
        print(response.statusCode.toString());
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
    return null;
  }

  ///----getting userProfile----------
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

  ///--------SignIn-------------------\\
  static Future<BasicResponse> SignIn(
      String azatag,String password,String deviceId) async {
    var url = Constants.baseUrl(true) + '/auth/signin';
    // print('PayMerchant $token');
    // final signin = SignIn(azatag, password, deviceId);
    final response = await http.post(
      url,
      body: {
        'tag':azatag,
        'password' :password,
        'device' : deviceId,
        'isNewDevice' : true
      },
      headers: {
        // HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    );

    try {
      if (response.statusCode == 200) {
        print("success66" + response.headers.toString());
        print("success65" + response.request.toString());
        print("success67" + response.body.toString());
        final statusCode = json.decode(response.body)['status'];
        if (statusCode == 200) {
          var data = BasicResponse.fromJson(json.decode(response.body));
          print("success68" + data.toString());
          return data;
        } else {
          var data = BasicResponse.fromJson(json.decode(response.body));
          print("success68" + data.toString());
          return data;
        }
      } else {
        print("success66" + response.headers.toString());
        print("success65" + response.request.toString());
        print("success64" + response.statusCode.toString());
      }
    } catch (e) {
      print('Merror' + e.toString());
      return null;
    }
    return null;
  }

  ///--------payment--- to Merchant---------

  static Future<dynamic> payMerchant(
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
        final statusCode = json.decode(response.body)['status'];
        if (statusCode == 200) {
          var data = PayMerchantResp.fromJson(json.decode(response.body));
          print("success68" + data.toString());
          return data;
        } else {
          var data = BaseResponse.fromJson(json.decode(response.body));
          print("success68" + data.toString());
          return data;
        }
      } else {
        print("success66" + response.headers.toString());
        print("success65" + response.request.toString());
        print("success64" + response.statusCode.toString());
      }
    } catch (e) {
      print('Merror' + e.toString());
      return null;
    }
    return null;
  }


  ///------save to beneficiary---
  static Future<dynamic> saveBeneficiary(
      String AZaAgentTag, String token) async {
    var url = Constants.baseUrl(true) + '/wallet/link/agent';
    print('PayMerchant $token');
    final response = await http.post(
      url,
      body: json.encode(
        {"agentTag": AZaAgentTag},
      ),
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
      }
    } catch (e) {
      print('Merror' + e.toString());
      return null;
    }
    return null;
  }

  ///------payment--- to AzaAgent------

  static Future<PayazaAgent> payAgent(
      PayazaAgent payazaAgent, String token) async {
    var url = Constants.baseUrl(true) + '/fund/withdraw/via/agent';
    print('PayAgent $token');
    final response = await http.post(
      url,
      body: json.encode(payazaAgent),
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
        var data = PayazaAgent.fromJson(json.decode(response.body));
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
