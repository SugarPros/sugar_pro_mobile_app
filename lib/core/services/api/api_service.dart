import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/enums/http_method.dart';
import 'package:sugar_pros/core/exceptions/auth_exception.dart';
import 'package:sugar_pros/core/services/http/http_service_impl.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ApiService with ListenableServiceMixin {
  final HttpService _httpService = locator<HttpService>() as HttpServiceImpl;

  Future<Either<AppError, T>> makeRequest<T>({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? data,
    bool? isFormData,
    bool? isAuth = false,
    T Function(dynamic)? fromJson,
  }) async {
    _httpService.toggleEncryption(false);
    try {
      FormattedResponse raw;

      // Perform request based on method type
      switch (method) {
        case HttpMethod.get:
          raw = await _httpService.getHttp(
            url,
            params: data,
          );
          break;
        case HttpMethod.post:
          raw = await _httpService.postHttp(
            url,
            data ?? {},
            formdata: isFormData ?? false,
          );
          break;
        case HttpMethod.put:
          raw = await _httpService.putHttp(
            url,
            data ?? {},
          );
          break;
        case HttpMethod.patch:
          raw = await _httpService.putHttp(url, data ?? {});
          break;
        case HttpMethod.delete:
          raw = await _httpService.deleteHttp(url);
          break;
      }

      // Check response success and parse JSON if provided
      if (raw.success && fromJson != null) {
        if (method == HttpMethod.put) {
          return Right(raw.data);
        } else {
          return Right(fromJson((raw.data)));
        }
      } else {
        return Left(
          AppError(
            errorType: AppErrorType.network,
            message:
                (raw.errors ?? raw.responseCodeError ?? 'An error occurred'),
          ),
        );
      }
    } on NetworkException catch (e) {
      return Left(
        AppError(errorType: AppErrorType.network, message: e.message),
      );
    } on SocketException catch (e) {
      return Left(
        AppError(errorType: AppErrorType.network, message: e.message),
      );
    } on AuthException catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: e.message));
    } on Exception catch (e) {
      return Left(AppError(errorType: AppErrorType.api, message: '$e'));
    } catch (e) {
      Logger.e('Error from API Service: $e, with endpoint: $url');
      return const Left(
        AppError(
          errorType: AppErrorType.api,
          message: 'An error occurred. Please try again',
        ),
      );
    }
  }
}
