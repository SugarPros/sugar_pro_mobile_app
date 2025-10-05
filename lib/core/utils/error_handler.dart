import 'package:sugar_pros/core/exceptions/network_exception.dart';
import '../utils/network_utils.dart' as network_utils;

class ErrorHandler {
  static void parseError(dynamic e) {
    if (e.response == null) {
      throw NetworkException('Connection error');
    }

    if (e.toString().contains('500')) {
      throw const NetworkException(
        'Oops! Something went wrong while processing your request. Please try again later.',
      );
    }

    final rawData = e.response?.data;
    final data = network_utils.decodeResponseBodyToJson(rawData);

    String errorMessage = 'An unexpected error occurred.';

    // ✅ Handle "message" key (your API style)
    if (data is Map && data.containsKey('message')) {
      errorMessage = data['message']?.toString() ?? errorMessage;
    }
    // ✅ Handle "errors" key (old style)
    else if (data is Map && data.containsKey('errors')) {
      final errors = data['errors'];

      if (errors is List) {
        final messages = errors
            .map((error) => error['errorMessages'] as List?)
            .where((list) => list != null && list.isNotEmpty)
            .expand((list) => list!)
            .toList();

        if (messages.isNotEmpty) {
          errorMessage = messages.join('\n');
        }
      } else if (errors is String) {
        errorMessage = errors;
      } else if (errors is Map) {
        final messages = errors.values.expand((val) {
          if (val is List) return val;
          return [val];
        }).toList();

        if (messages.isNotEmpty) {
          errorMessage = messages.join('\n');
        }
      }
    }

    throw NetworkException(errorMessage);
  }
}
