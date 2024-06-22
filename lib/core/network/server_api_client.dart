import 'dart:convert';
import 'dart:developer';
import 'package:indubatch_movil/core/models/response_without_result_model.dart';
import 'package:indubatch_movil/core/network/server_info.dart';
import 'package:indubatch_movil/core/repositories/local_storage_repository.dart';
import 'package:indubatch_movil/features/auth/domain/entities/login/response_login_entity.dart';

import '../utils/transversal.dart';
import 'network_info.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'exception.dart';

class ServerApiClient {
  final NetworkInfoRepository networkInfoRepository;
  final LocalStorageRepository localStorageRepository;

  ServerApiClient({
    required this.networkInfoRepository,
    required this.localStorageRepository,
  });

  final Map<String, String> _authHeader = {};

  //Here we can access  to external auth header
  Map<String, String> get authHeader => _authHeader;

  // With tahs method ensured the authorization to the headers
  void setAccessToken({
    required String accessToken,
  }) {
    if (accessToken.isNotEmpty) {
      _authHeader[authHeaderKey] = accessToken;
    }
  }

  void deleteAccessToken() {
    _authHeader.remove(authHeaderKey);
    _authHeader.remove('Content-Type');
  }

  Future<void> _restoreAuthHeaders() async {
    if (_authHeader.isEmpty) {
      LoginResponseEntity? tokenEntity;
      try {
        tokenEntity = await localStorageRepository.getSecureUserInfoStorage();
      } catch (e) {
        log(e.toString());
      }
      if (tokenEntity != null) {
        _authHeader[authHeaderKey] = tokenEntity.token!;
      }
      _authHeader['Content-Type'] = "application/json";
    }
  }

  ///method to process the server response
  Future<T> _proccessResponse<T>({
    required http.Response response,
    required Future<T> Function() requestFunc,
  }) async {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return response as T;
    } else if (response.statusCode >= 400 && response.statusCode <= 500) {
      var respuesta =
          ResponseWithoutResultModel.fromJson(jsonDecode(response.body));

      throw ServerException(message: respuesta.messageResponse.description);
    } else if (response.statusCode >= 500) {
      throw ServerException(
          message: "Servicio no disponible. Contacte al administrador");
    } else {
      return response as T;
    }
  }

  /// Method to format the log response
  String _formatResponseLog(http.Response response, {Object? requestBody}) {
    final time = DateTime.now().toUtc().toIso8601String();

    JsonEncoder encoder = const JsonEncoder.withIndent(' ');
    String formattedRequestBody =
        requestBody != null ? encoder.convert(requestBody) : '';

    String formattedBodyJson;

    try {
      final json = jsonDecode(response.body);
      formattedBodyJson = encoder.convert(json);
    } catch (_) {
      formattedBodyJson = response.body;
    }

    return '''
          $time
          Request: ${response.request}${formattedRequestBody.isNotEmpty == true ? '\n  Request body: $formattedRequestBody' : ''}
          Response code: ${response.statusCode}
          Body: $formattedBodyJson
          ''';
  }

  ///Method HTTP GET protocol
  Future<http.Response> get(
    host,
    path,
    serverSchema, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = Uri(
      scheme: serverSchema,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );

    http.Response response;

    try {
      await _restoreAuthHeaders();
      response =
          await http.get(url, headers: _authHeader..addAll(headers ?? {}));
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => get(
        host,
        path,
        serverSchema,
        queryParameters: queryParameters,
        headers: headers,
      ),
    );
  }

  ///Method HTTP POST protocol
  Future<http.Response> post(
    host,
    path,
    serverScheme, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: serverScheme,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );

    final Map<String, String> allHeaders = _authHeader;

    if (headers != null) {
      allHeaders.addAll(headers);
    }
    if (!allHeaders.containsKey('Content-Type')) {
      allHeaders['Content-Type'] = "application/json";
    }

    http.Response response;

    try {
      response = await http.post(
        url,
        headers: allHeaders,
        body: Transversal().fixJson(jsonEncode(body)),
        encoding: encoding,
      );
    } catch (e) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => post(
        host,
        path,
        serverScheme,
        queryParameters: queryParameters,
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }

  ///Method HTTP put protocol
  Future<http.Response> put(
    host,
    path,
    serverSchema, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final url = Uri(
      scheme: serverSchema,
      host: host,
      path: path,
      queryParameters: queryParameters,
    );
    await _restoreAuthHeaders();

    if (headers != null) {
      _authHeader.addAll(headers);
    }
    if (!_authHeader.containsKey('Content-Type')) {
      _authHeader['Content-Type'] = "application/json";
    }

    http.Response response;

    try {
      response = await http.put(
        url,
        headers: _authHeader,
        body: jsonEncode(body),
        encoding: encoding,
      );
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => put(
        host,
        path,
        serverSchema,
        queryParameters: queryParameters,
        headers: headers,
        body: body,
        encoding: encoding,
      ),
    );
  }

  ///Method HTTP GET protocol
  Future<http.Response> getBlobStorage(
    path,
  ) async {
    final url = Uri(
      path: path,
    );

    http.Response response;

    try {
      response = await http.get(url);
    } catch (_) {
      final check = await networkInfoRepository.hasConnection;

      if (!check) {
        throw ConnectionException();
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _proccessResponse(
      response: response,
      requestFunc: () => getBlobStorage(path),
    );
  }
}
