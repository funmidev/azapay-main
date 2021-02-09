import 'dart:async';
import 'dart:io';

import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:logger/logger.dart';

class ApiInterceptor extends Interceptor {
  final repository = Repository();
  final BasicResponse token;
  final Dio dio;
  Dio tokenDio = Dio();
  final _logger = Logger();
  String csrfToken;
  ApiInterceptor({this.token, this.dio});
  @override
  Future onRequest(RequestOptions options) {
    if (token != null) {
      csrfToken = token.token;
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${token.token}';
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    _logger.i(response.data);
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    _logger.i(err.response?.statusCode);
    _logger.i(err.response?.statusMessage);
    _logger.i(err.response?.data.toString());
    // print('Bearer ${token.token}');
    // || err.response?.statusCode == 403 || err.response?.statusCode == 402
    // final retrieveAzapayUser = await repository.retrieveAzapayUser();

    // const _extra = <String, dynamic>{};
    // final queryParameters = <String, dynamic>{};
    // final _data = <String, dynamic>{};
    // _data.addAll(SignIn(
    //             tag: '${retrieveAzapayUser.tag}',
    //             password: retrieveAzapayUser.password,
    //             device: retrieveAzapayUser.device)
    //         ?.toJson() ??
    //     <String, dynamic>{});
    // _data.removeWhere((k, v) => v == null);
    // final Response<Map<String, dynamic>> _result = await tokenDio.request('/auth/signin',
    //     queryParameters: queryParameters,
    //     options: RequestOptions(
    //         method: 'POST',
    //         headers: <String, dynamic>{},
    //         extra: _extra,
    //         baseUrl: 'http://azapaybackenddev-env.eba-3j4mixtm.eu-central-1.elasticbeanstalk.com'),
    //     data: _data);
    // final value = BasicResponse<String>.fromJson(_result.data);
    // _logger.i(value);

    if (err.response?.statusCode == 401) {
      final options = err.response.request;

      //todo: lock the dio
      // _logger.i('Hiii');
      // if (dio.interceptors.errorLock.locked) {
      //   if (_lockFuture != null) {
      //     await _lockFuture;
      //   }
      // }

      print('Bearer ${token.token}');
      // print(csrfToken);
      print(options.headers[HttpHeaders.authorizationHeader]);

      // if ('Bearer ${csrfToken}' != options.headers[HttpHeaders.authorizationHeader]) {
      //   options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${csrfToken}';
      //   print(options.path);
      //   print(options.data);

      //   final response = await dio.request(options.path,
      //       options: options,
      //       queryParameters: options.queryParameters ?? <String, dynamic>{},
      //       data: options.data ?? <String, dynamic>{});
      //   _logger.i(response.statusCode);
      // }

      dio.lock();
      dio.interceptors.responseLock.lock();
      dio.interceptors.errorLock.lock();

      //todo: resend the user details (1)

      final retrieveAzapayUser = await repository.retrieveAzapayUser();
      const _extra = <String, dynamic>{};
      final queryParameters = <String, dynamic>{};
      final _data = <String, dynamic>{};
      _data.addAll(SignIn(
                  tag: '${retrieveAzapayUser.tag}',
                  password: retrieveAzapayUser.password,
                  device: retrieveAzapayUser.device)
              ?.toJson() ??
          <String, dynamic>{});
      _data.removeWhere((k, v) => v == null);
      //   final Response<Map<String, dynamic>> _result = await tokenDio.request('/auth/signin',
      // queryParameters: queryParameters,
      // options: RequestOptions(
      //     method: 'POST',
      //     headers: <String, dynamic>{},
      //     extra: _extra,
      //     baseUrl: 'http://azapaybackenddev-env.eba-3j4mixtm.eu-central-1.elasticbeanstalk.com'),
      // data: _data);
      // _logger
      //     .i('${retrieveAzapayUser.tag.contains('#') ? retrieveAzapayUser.tag.substring(1) : retrieveAzapayUser.tag}');
      return tokenDio
          .request('/auth/signin',
              queryParameters: queryParameters,
              options: RequestOptions(
                  method: 'POST',
                  headers: <String, dynamic>{},
                  extra: _extra,
                  baseUrl: 'http://azapaybackenddev-env.eba-3j4mixtm.eu-central-1.elasticbeanstalk.com'),
              data: _data)
          .then((signinresponse) async {
        // final Response<Map<String, dynamic>> _result = signinresponse;
        final value = BasicResponse<String>.fromJson(signinresponse.data);
        _logger.i(value.toString());

        await repository.addToken(basicResponse: value);
        //todo: replace or update the former token (3)
        final retrieveToken = await repository.retrieveToken();
        //todo: add the new token to the requestoptions (4)
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${retrieveToken.token}';
        csrfToken = retrieveToken.token;

        // //todo check if token recieved is valid (2)
        // return repository.validateToken(token: Token(token: signinresponse.token)).then((response) async {
        //   await repository.addToken(basicResponse: signinresponse);
        //   //todo: replace or update the former token (3)
        //   final retrieveToken = await repository.retrieveToken();
        //   //todo: add the new token to the requestoptions (4)
        //   options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${retrieveToken.token}';
        //   csrfToken = retrieveToken.token;
        // })
      }).whenComplete(() {
        dio.unlock();
        dio.interceptors.responseLock.unlock();
        dio.interceptors.errorLock.unlock();
      }).then((value) {
        print(options.path);
        print(options.data);
        print(options.headers.toString());

        return dio
            .request(options.path,
                options: options,
                queryParameters: options.queryParameters ?? <String, dynamic>{},
                data: options.data ?? <String, dynamic>{})
            .then((value) => _logger.i(value.data));
      });
    }
    return err;
  }
}

class InMemoryTokenHiveStorage implements TokenStorage<String> {
  final _repository = Repository();
  @override
  Future<void> delete() async {
    await _repository.deleteToken();
  }

  @override
  Future<String> read() async {
    if (_repository.retrieveToken() == null) {
      return null;
    } else {
      return _repository.retrieveToken().token;
    }
  }

  @override
  Future<void> write(String token) async {
    await _repository.addToken(basicResponse: BasicResponse(token: token));
  }
}
