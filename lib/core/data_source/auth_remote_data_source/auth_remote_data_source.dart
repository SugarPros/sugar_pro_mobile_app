import 'package:dartz/dartz.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/models/complaince_response.dart';
import 'package:sugar_pros/core/models/pat_basic_details.dart';
import 'package:sugar_pros/core/models/patient_account_response.dart';
import 'package:sugar_pros/core/models/patient_agreement_response.dart';
import 'package:sugar_pros/core/models/patient_dashboard_response.dart';
import 'package:sugar_pros/core/models/privacy_response.dart';
import 'package:sugar_pros/core/models/pro_dashboard_response.dart';
import 'package:sugar_pros/core/models/self_payment_response.dart';
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

  Future<Either<AppError, dynamic>> signupNewUser({
    required String? username,
    required String? email,
    required String? prefixCode,
    required String? mobile,
    required String? password,
  });

  Future<Either<AppError, PatBasicDetails>> getPatBasicDetails();

  Future<Either<AppError, dynamic>> patBasicDetails({
    String? fname,
    String? mname,
    String? lname,
    String? dob,
    String? gender,
    String? email,
    String? phone,
    String? street,
    String? city,
    String? state,
    String? zipCode,
    String? medicareNumber,
    String? groupNumber,
    dynamic license,
    String? ssn,
    String? notificationType,
  });

  Future<Either<AppError, PrivacyResponse>> getPrivacyForm();

  Future<Either<AppError, ComplianceResponse>> getComplianceForm();

  Future<Either<AppError, PatientAgreementResponse>> getFinancialAgreementForm();

  Future<Either<AppError, SelfPaymentResponse>> getSelfPaymentForm();

  Future<Either<AppError, dynamic>> privacyForm({
    required String? firstName,
    required String? lastName,
    required String? date,
    required String? userMessage,
    required String? isPrivacyPractice,
    required String? patientName,
    required String? repName,
    required String? serviceDate,
    required String? relationship,
  });

  Future<Either<AppError, dynamic>> complianceForm({
    required String? patientName,
    required String? dob,
    required dynamic patientSignature,
    required String? patientDob,
    required dynamic repSignature,
    required String? repDate,
    required String? natureWithPatient,
  });

  Future<Either<AppError, dynamic>> agreementForm({
    required String? userName,
    required String? patientName,
    required String? patientSignatureDate,
    required String? relationship,
  });

  Future<Either<AppError, dynamic>> selfPaymentForm({
    required String? userName,
    required String? patientName,
    required String? patientSignatureDate,
  });
}
