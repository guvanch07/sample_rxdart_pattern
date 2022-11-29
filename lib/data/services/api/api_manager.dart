import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rxdart_pattern/data/core/error_handler.dart';
import 'package:rxdart_pattern/data/services/api/header_service.dart';
import 'package:rxdart_pattern/data/services/api/locale.dart';

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

class APIManager {
  final http.Client _client;
  final HeadersService _headersService;

  APIManager({
    required http.Client client,
    required HeadersService headersService,
  })  : _client = client,
        _headersService = headersService,
        super();

  HttpClient httpClient = HttpClient();

  /// it must be map
  /// because of incorrect api i had to change map to dynamic

  /// GET REQUEST
  Future<dynamic> getAPICall({
    required Uri url,
    required bool needAuth,
    Map<String, dynamic>? queryParameters,

    /// Поставить true, если в запросе уже имеются параметры. По умолчанию false
    bool hasQuery = false,
  }) async {
    int retryCounter = 3;

    /// Add locale to query parameters
    //final locale = LocaleService.locale();

    if (!hasQuery) {
      url = url.resolveUri(Uri(queryParameters: queryParameters));
    }

    log("⚙️ \x1B[35mCalling get API: $url", name: 'REQUEST');
    Map<String, String> headers;

    try {
      headers = await setHeaders(needAuth);
      log('⚙️ $headers', level: 1, name: 'HEADERS');
    } catch (e) {
      throw LocalAuthenificationException();
    }

    dynamic responseJson;
    try {
      final response = await _client
          .get(
            url,
            headers: headers,
          )
          .timeout(const Duration(seconds: 2));
      responseJson = _response(response);
    } on TimeoutException {
      /// Простая стратегия повторного запроса, пробуем 3 раза
      if (retryCounter == 0) {
        throw TimeoutException('Timeout server response');
      } else {
        retryCounter = retryCounter - 1;

        /// рекурсия
        return await getAPICall(url: url, needAuth: needAuth);
      }
    } on SocketException {
      throw FetchDataException();
    }
    return responseJson;
  }

  /// POST REQUEST
  Future<Map<String, dynamic>> postAPICall({
    required Uri url,
    required Map<String, dynamic> body,
    required bool needAuth,
  }) async {
    /// Add locale to query parameters
    final locale = LocaleService.locale();
    url = url.resolveUri(Uri(queryParameters: {'locale': locale}));

    log("⚙️ \x1B[35mCalling post API: $url", name: 'REQUEST');
    log("⚙️ Calling parameters: $body", name: 'PARAMETERS');
    Map<String, String> headers;

    try {
      headers = await setHeaders(needAuth);
      log('⚙️ $headers', level: 1, name: 'HEADERS');
    } catch (e) {
      throw LocalAuthenificationException();
    }

    Map<String, dynamic> responseJson;
    try {
      final response = await _client.post(
        url,
        body: json.encode(body),
        headers: headers,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException();
    }
    return responseJson;
  }

  Future<Map<String, String>> setHeaders(bool needAuth) async {
    return needAuth
        ? await _headersService.getHeadersAuth()
        : await _headersService.getUnauthHeaders();
  }

  _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException();

      case 500:
      default:
        throw FetchDataException();
    }
  }
}
