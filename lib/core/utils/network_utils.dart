import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:sugar_pros/core/constants/env/app_env.dart';
import 'package:sugar_pros/core/exceptions/network_exception.dart';
import 'package:sugar_pros/core/utils/logger.dart';

void checkForNetworkExceptions(Response response) {
  if (response.statusCode! < 200 || response.statusCode! >= 400) {
    throw const NetworkException('Failed to connect to internet');
  }
}

void showLoadingProgress(received, total) {
  if (total != -1) {
    if(AppEnv().appDebug == 'true') {
      Logger.d('${(received / total * 100).toStringAsFixed(0)}%');
    }
  }
}

dynamic decodeResponseBodyToJson(String body) {
  try {
    final data = convert.jsonDecode(body);
    return data;
  } on FormatException catch (e) {
    if(AppEnv().appDebug == 'true') {
      Logger.e('Network Utils: Failed to decode response body ${e.message}');
    }
    if (e.message.contains('Unexpected')) {
      throw const NetworkException('Oops! Something went wrong while processing your request. Please try again later.');
    } else {
      throw NetworkException(e.message);
    }
  }
}