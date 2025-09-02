import 'package:sugar_pros/core/utils/exports.dart';

abstract class HttpService {
  /// Send GET request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if GET fails
  Future<FormattedResponse> getHttp(
    String route, {
    Map<String, dynamic>? params,
  });

  /// Send POST request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<FormattedResponse> postHttp(
    String route,
    Map<String, dynamic> body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
    bool decrypt = true,
  });

  /// Send request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<FormattedResponse> downloadHttp(
    String route,
    dynamic body,
    String path,
  );

  /// Send POST request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<FormattedResponse> putHttp(
    String route,
    dynamic body, {
    Map<String, dynamic> params,
    bool formdata = false,
    bool decrypt = true,
  });

  /// Send DELETE request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if DELETE fails
  Future<dynamic> deleteHttp(
    String route, {
    Map<String, dynamic> params,
    Map<String, dynamic>? body,
  });

  /// Set the header to use for further requests
  Future<void> setHeader();

  void toggleEncryption(bool enabled);

  /// Clear headers set
  clearHeaders();

  void dispose();
}
