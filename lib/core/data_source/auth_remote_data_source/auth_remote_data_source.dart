import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/models/pat_basic_details.dart';
import 'package:sugar_pros/core/models/patient_dashboard_response.dart';
import 'package:sugar_pros/core/models/pro_dashboard_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';

abstract class AuthRemoteDataSource {
  Future<Either<AppError, dynamic>> proSendOtp({
    required String? email,
    required String? username,
    required String? prefixCode,
    required String? providerRole,
    required String? mobile,
    required String? password,
    required String? passwordConfirmation,
  });

  Future<Either<AppError, ProAuthResponse>> proLogin({
    required String? email,
    required String? password,
  });

  Future<Either<AppError, ProDashboardResponse>> proDashboard();

  Future<Either<AppError, PatAuthResponse>> patLogin({
    required String? email,
    required String? password,
  });

  Future<Either<AppError, PatBasicDetails>> patBasicDetails();

  Future<Either<AppError, PatientDashboardResponse>> patDashboard();
}
