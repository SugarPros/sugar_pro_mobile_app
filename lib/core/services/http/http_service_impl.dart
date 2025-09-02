import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sugar_pros/core/exceptions/auth_exception.dart';
import 'package:sugar_pros/core/models/user/user.dart';
import 'package:sugar_pros/core/services/device_info_service.dart';
import 'package:sugar_pros/core/services/user_service.dart';
import 'package:sugar_pros/core/utils/error_handler.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import '../../utils/network_utils.dart' as network_utils;

class HttpServiceImpl extends HttpService {
  final DeviceInfoService _deviceInfo = locator<DeviceInfoService>();
  final UserService _userService = locator<UserService>();

  User? get user => _userService.user;

  final Dio _dio =
      Dio(BaseOptions(connectTimeout: const Duration(minutes: 2)))
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
            compact: true,
            enabled: false, //AppEnv().appDebug == 'true',
            maxWidth: 90,
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              log('🔼 Request: [${options.method}] ${options.uri}');
              log('📦 Data: ${options.data}');
              handler.next(options);
            },
            onResponse: (response, handler) {
              if (response.requestOptions.path.contains('/BusinessProfiles')) {
                debugPrint('✅ Business Profile response: ${(response.data)}');
              }

              log('✅ Response [${response.statusCode}] from ${response.requestOptions.uri}');
              log('📨 Data: ${response.data}');
              handler.next(response);
            },
            onError: (error, handler) {
              log('❌ Error: ${error.message}');
              if (error.response != null) {
                log('📉 Response: ${error.response?.data}');
              }
              handler.next(error);
            },
          ),
        );

  @override
  void toggleEncryption(bool enabled) {
    // No-op: Encryption disabled
  }

  @override
  Future<void> setHeader({bool formdata = false, bool formEncoded = false}) async {
    final contentType =
        formdata
            ? 'multipart/form-data'
            : formEncoded
            ? 'application/x-www-form-urlencoded'
            : 'application/json';

    final token = user?.token ?? '';

    _dio.options.headers = {
      'content-type': contentType,
      'Accept': contentType,
      'AppVersion': _deviceInfo.version,
      'DeviceId': _deviceInfo.id,
      'REMOTE_ADDR': _deviceInfo.ip,
      'Authorization': 'Bearer $token',
    };
  }

  @override
  void dispose() {
    _dio.interceptors.clear();
    _dio.close(force: true);
  }

  @override
  void clearHeaders() => _dio.options.headers.clear();

  String _buildUrl(String route) => '${AppEnv().api}$route';

  Options _buildOptions({required String contentType}) =>
      Options(contentType: contentType, responseType: ResponseType.plain);

  dynamic _prepareData(Map<String, dynamic> body, {bool formdata = false}) {
    return formdata ? FormData.fromMap(body) : jsonEncode(body);
  }

  @override
  Future<FormattedResponse> getHttp(
    String route, {
    Map<String, dynamic>? params,
    bool formdata = false,
  }) async {
    final url = _buildUrl(route);
    params?.removeWhere((_, value) => value == null);

    try {
      await setHeader(formdata: formdata);
      final response = await _dio.get(
        url,
        queryParameters: params,
        options: _buildOptions(contentType: 'application/json'),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioException(e, url);
    } catch (e) {
      Logger.e('Unhandled exception: $e');
    }
    return FormattedResponse(success: false, data: null);
  }

  @override
  Future<FormattedResponse> postHttp(
    String route,
    Map<String, dynamic> body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool useCache = false,
    bool formEncoded = false,
    bool decrypt = true, // Can be removed if not used externally
  }) async {
    final url = _buildUrl(route);
    body.removeWhere((_, value) => value == null);
    params?.removeWhere((_, value) => value == null);

    final contentType =
        formdata
            ? 'multipart/form-data'
            : formEncoded
            ? 'application/x-www-form-urlencoded'
            : 'application/json';
    final data = _prepareData(body, formdata: formdata);

    try {
      await setHeader(formdata: formdata, formEncoded: formEncoded);
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
        options: _buildOptions(contentType: contentType),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioException(e, url);
    }
    return FormattedResponse(success: false, data: null);
  }

  @override
  Future<FormattedResponse> downloadHttp(String route, dynamic body, String path) async {
    final url = _buildUrl(route);
    body?.removeWhere((_, value) => value == null);

    try {
      await setHeader();
      final response = await _dio.download(
        url,
        path,
        data: jsonEncode(body),
        options: Options(contentType: 'application/json', method: 'POST'),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioException(e, url);
    }
    return FormattedResponse(success: false, data: null);
  }

  @override
  Future<FormattedResponse> putHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool decrypt = true, // Can be removed if not used externally
  }) async {
    final url = _buildUrl(route);
    body?.removeWhere((_, value) => value == null);
    params?.removeWhere((_, value) => value == null);
    final data = _prepareData(body, formdata: formdata);

    try {
      await setHeader(formdata: formdata);
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: params,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
        options: _buildOptions(contentType: formdata ? 'multipart/form-data' : 'application/json'),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioException(e, url);
    }
    return FormattedResponse(success: false, data: null);
  }

  @override
  Future<FormattedResponse> deleteHttp(
    String route, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
  }) async {
    final url = _buildUrl(route);
    params?.removeWhere((_, value) => value == null);

    try {
      await setHeader();
      final response = await _dio.delete(
        url,
        queryParameters: params,
        data: body ?? {},
        options: Options(contentType: 'application/json'),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      _handleDioException(e, url);
    }
    return FormattedResponse(success: false, data: null);
  }

  FormattedResponse _handleResponse(Response response) {
    final success = [200, 201, 204].contains(response.statusCode);
    final raw = response.data.toString();
    final data = _tryDecode(() => jsonDecode(raw));
    return FormattedResponse(success: success, data: data);
  }

  dynamic _tryDecode(Function decodeFn) {
    try {
      return decodeFn();
    } catch (_) {
      return null;
    }
  }

  void _handleDioException(DioException e, String url) {
    Logger.e('HTTP Error [$url]: ${e.message}');
    if (e.response?.statusCode == 401) {
      if (Navigator.of(StackedService.navigatorKey!.currentContext!).canPop()) {}
      throw const AuthException('Session Expired');
    }
    ErrorHandler.parseError(e);
  }

  String safeJsonLog(dynamic data) {
    dynamic sanitize(dynamic value) {
      if (value is String && _isBase64(value)) {
        return '(base64 omitted)';
      } else if (value is Map) {
        return value.map((k, v) => MapEntry(k, sanitize(v)));
      } else if (value is List) {
        return value.map(sanitize).toList();
      }
      return value;
    }

    try {
      final cleaned = sanitize(data);
      return const JsonEncoder.withIndent('  ').convert(cleaned);
    } catch (e) {
      return data.toString();
    }
  }

  bool _isBase64(String str) {
    if (str.length < 100) return false;
    final base64Regex = RegExp(r'^[A-Za-z0-9+/]+={0,2}$');
    return base64Regex.hasMatch(str);
  }
}
