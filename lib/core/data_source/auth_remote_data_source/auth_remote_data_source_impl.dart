import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/enums/http_method.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/models/pat_basic_details.dart';
import 'package:sugar_pros/core/models/patient_dashboard_response.dart';
import 'package:sugar_pros/core/models/pro_dashboard_response.dart';
import 'package:sugar_pros/core/services/api/api_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService _apiService = locator<ApiService>();

  @override
  Future<Either<AppError, dynamic>> proSendOtp({
    required String? email,
    required String? username,
    required String? prefixCode,
    required String? providerRole,
    required String? mobile,
    required String? password,
    required String? passwordConfirmation,
  }) {
    final Map<String, dynamic> payload = {
      'email': email,
      'username': username,
      'prefix_code': prefixCode,
      'provider_role': providerRole,
      'mobile': mobile,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };

    return _apiService.makeRequest(
      url: 'provider/auth/register',
      method: HttpMethod.post,
      data: payload,
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, ProAuthResponse>> proLogin({
    required String? email,
    required String? password,
  }) {
    final Map<String, dynamic> payload = {'email': email, 'password': password};

    return _apiService.makeRequest(
      url: 'provider/auth/login',
      method: HttpMethod.post,
      data: payload,
      fromJson: (json) => ProAuthResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, ProDashboardResponse>> proDashboard() {
    return _apiService.makeRequest(
      url: 'provider/dashboard',
      method: HttpMethod.get,
      fromJson: (json) => ProDashboardResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, PatAuthResponse>> patLogin({
    required String? email,
    required String? password,
  }) {
    final Map<String, dynamic> payload = {'email': email, 'password': password};

    return _apiService.makeRequest(
      url: 'login-existing-user',
      method: HttpMethod.post,
      data: payload,
      fromJson: (json) => PatAuthResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, PatBasicDetails>> patBasicDetails() {
    return _apiService.makeRequest(
      url: 'basic',
      method: HttpMethod.get,
      fromJson: (json) => PatBasicDetails.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, PatientDashboardResponse>> patDashboard() {
    return _apiService.makeRequest(
      url: 'dashboard',
      method: HttpMethod.get,
      fromJson: (json) => PatientDashboardResponse.fromJson(json),
    );
  }
}
