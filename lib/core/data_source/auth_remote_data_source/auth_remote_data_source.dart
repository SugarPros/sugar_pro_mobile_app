import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/models/pat_basic_details.dart';
import 'package:sugar_pros/core/models/patient_account_response.dart';
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

  Future<Either<AppError, PatientAccountResponse>> getPatientAccount();

  Future<Either<AppError, dynamic>> updatePaientDetails({
    String? firstName,
    String? lastName,
    String? middlename,
    String? phone,
    String? email,
    String? dob,
    String? gender,
    String? emergencyName,
    String? emergencyPhone,
    String? emergencyRelationship,
    String? street,
    String? city,
    String? zipCode,
    String? state,
    String? insuranceProvider,
    String? insurancePlanNumber,
    String? insuranceGroupNumber,
    dynamic licenseFile,
    String? ssn,
    String? notificationType,
  });

  Future<Either<AppError, dynamic>> uploadProfilePic(dynamic profilePictureFile);

  Future<Either<AppError, dynamic>> sendOtp(String? email);

  Future<Either<AppError, dynamic>> confirmOtp({required String? email, required String otp});

  Future<Either<AppError, dynamic>> changePassword({
    required String? email,
    required String? currentPassword,
    required String? newPassword,
  });

  Future<Either<AppError, dynamic>> sendEmailOtp(String? email);

  Future<Either<AppError, dynamic>> confirmEmailOtp({required String? email, required String otp});

  Future<Either<AppError, dynamic>> changeEmail({
    required String? email,
    required String? newEmail,
    required String? currentPassword,
  });

  Future<Either<AppError, dynamic>> deleteAccount();

  Future<Either<AppError, dynamic>> sendOtpTouser({
    required String? username,
    required String? email,
    required String? prefixCode,
    required String? mobile,
  });

  Future<Either<AppError, dynamic>> verifyOtp({
    required String? username,
    required String? email,
    required String? otp,
  });

  Future<Either<AppError, dynamic>> sugnupNewUser({
    required String? username,
    required String? email,
    required String? prefixCode,
    required String? mobile,
    required String? password,
  });
}
