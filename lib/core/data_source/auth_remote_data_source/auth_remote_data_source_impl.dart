import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/enums/http_method.dart';
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
import 'package:sugar_pros/core/services/api/api_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:mime/mime.dart';

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
      isFormData: true,
      data: payload,
      fromJson: (json) => PatAuthResponse.fromJson(json),
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

  @override
  Future<Either<AppError, PatientAccountResponse>> getPatientAccount() {
    return _apiService.makeRequest(
      url: 'account',
      method: HttpMethod.get,
      fromJson: (json) => PatientAccountResponse.fromJson(json),
    );
  }

  @override
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
    dynamic licenseFile, // can be local file path or server path
    String? ssn,
    String? notificationType,
  }) async {
    final Map<String, dynamic> payload = {
      "fname": firstName,
      "mname": middlename,
      "lname": lastName,
      "dob": dob,
      "gender": gender,
      "email": email,
      "phone": phone,
      "emmergency_name": emergencyName,
      "emmergency_relationship": emergencyRelationship,
      "emmergency_phone": emergencyPhone,
      "street": street,
      "city": city,
      "state": state,
      "zip_code": zipCode,
      "insurance_provider": insuranceProvider,
      "insurance_plan_number": insurancePlanNumber,
      "insurance_group_number": insuranceGroupNumber,
      "ssn": ssn,
      "notification_type": notificationType,
    };

    if (licenseFile != null) {
      final file = File(licenseFile.toString());
      if (file.existsSync()) {
        // It's a real local file → upload as MultipartFile
        final fileName = licenseFile.toString().split('/').last;
        final fileMimeType = lookupMimeType(licenseFile.toString()) ?? 'application/octet-stream';

        payload["license"] = await MultipartFile.fromFile(
          licenseFile.toString(),
          filename: fileName,
          contentType: MediaType.parse(fileMimeType),
        );
      } else {
        // It's just a string path from server (e.g. licenses/license_xxx.jpg)
        payload["license"] = licenseFile.toString();
      }
    }

    return _apiService.makeRequest(
      url: 'update-account-details',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> uploadProfilePic(dynamic profilePictureFile) async {
    final fileName = profilePictureFile.toString().split('/').last;
    final fileMimeType =
        lookupMimeType(profilePictureFile.toString()) ?? 'application/octet-stream';

    final Map<String, dynamic> payload = {
      "profilepicture": await MultipartFile.fromFile(
        profilePictureFile.toString(),
        filename: fileName,
        contentType: MediaType.parse(fileMimeType),
      ),
    };

    return _apiService.makeRequest(
      url: 'update-profile-picture',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> sendOtp(String? email) async {
    return _apiService.makeRequest(
      url: 'user-account-password-verification',
      method: HttpMethod.post,
      data: {'email': email},
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> confirmOtp({
    required String? email,
    required String otp,
  }) async {
    return _apiService.makeRequest(
      url: 'user-account-password-otp-verification',
      method: HttpMethod.post,
      data: {'email': email, 'otp': otp},
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> changePassword({
    required String? email,
    required String? currentPassword,
    required String? newPassword,
  }) {
    final Map<String, dynamic> payload = {
      'email': email,
      'current_password': currentPassword,
      'new_password': newPassword,
    };

    return _apiService.makeRequest(
      url: 'user-account-password-change',
      method: HttpMethod.post,
      data: payload,
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, dynamic>> sendEmailOtp(String? email) async {
    return _apiService.makeRequest(
      url: 'user-accout-email-verification',
      method: HttpMethod.post,
      data: {'email': email},
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> confirmEmailOtp({
    required String? email,
    required String otp,
  }) async {
    return _apiService.makeRequest(
      url: 'user-accout-otp-verification',
      method: HttpMethod.post,
      data: {'email': email, 'otp': otp},
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> changeEmail({
    required String? email,
    required String? newEmail,
    required String? currentPassword,
  }) {
    final Map<String, dynamic> payload = {
      'email': email,
      'new_email': newEmail,
      'current_password': currentPassword,
    };

    return _apiService.makeRequest(
      url: 'user-accout-email-change',
      method: HttpMethod.post,
      data: payload,
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, dynamic>> deleteAccount() {
    return _apiService.makeRequest(
      url: 'delete-account',
      method: HttpMethod.get,
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, dynamic>> sendOtpTouser({
    required String? username,
    required String? email,
    required String? prefixCode,
    required String? mobile,
  }) async {
    final Map<String, dynamic> payload = {
      "username": username,
      "email": email,
      "prefix_code": prefixCode,
      "mobile": mobile,
    };

    return _apiService.makeRequest(
      url: 'send-otp-to-user',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> verifyOtp({
    required String? username,
    required String? email,
    required String? otp,
  }) async {
    final Map<String, dynamic> payload = {"username": username, "email": email, "otp": otp};

    return _apiService.makeRequest(
      url: 'verify-otp',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> signupNewUser({
    required String? username,
    required String? email,
    required String? prefixCode,
    required String? mobile,
    required String? password,
  }) async {
    final Map<String, dynamic> payload = {
      "username": username,
      "email": email,
      "prefix_code": prefixCode,
      "mobile": mobile,
      "password": password,
    };

    return _apiService.makeRequest(
      url: 'signup-new-user',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, PatBasicDetails>> getPatBasicDetails() {
    return _apiService.makeRequest(
      url: 'basic',
      method: HttpMethod.get,
      fromJson: (json) => PatBasicDetails.fromJson(json),
    );
  }

  @override
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
  }) async {
    final fileName = license.toString().split('/').last;
    final fileMimeType = lookupMimeType(license.toString()) ?? 'application/octet-stream';

    final Map<String, dynamic> payload = {
      "fname": fname,
      "mname": mname,
      "lname": lname,
      "dob": dob,
      "gender": gender,
      "email": email,
      "phone": phone,
      "street": street,
      "city": city,
      "state": state,
      "zip_code": zipCode,
      "medicare_number": medicareNumber,
      "group_number": groupNumber,
      "license": await MultipartFile.fromFile(
        license.toString(),
        filename: fileName,
        contentType: MediaType.parse(fileMimeType),
      ),
      "ssn": ssn,
      "notification_type": notificationType,
    };

    return _apiService.makeRequest(
      url: 'basic',
      method: HttpMethod.post,
      isFormData: true,
      data: payload,
      fromJson: (json) => json,
    );
  }

  @override
  Future<Either<AppError, PrivacyResponse>> getPrivacyForm() {
    return _apiService.makeRequest(
      url: 'privacy',
      method: HttpMethod.get,
      fromJson: (json) => PrivacyResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, ComplianceResponse>> getComplianceForm() {
    return _apiService.makeRequest(
      url: 'compliance',
      method: HttpMethod.get,
      fromJson: (json) => ComplianceResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, PatientAgreementResponse>> getFinancialAgreementForm() {
    return _apiService.makeRequest(
      url: 'financial-responsibility-aggreement',
      method: HttpMethod.get,
      fromJson: (json) => PatientAgreementResponse.fromJson(json),
    );
  }

  @override
  Future<Either<AppError, SelfPaymentResponse>> getSelfPaymentForm() {
    return _apiService.makeRequest(
      url: 'agreement-for-self-payment',
      method: HttpMethod.get,
      fromJson: (json) => SelfPaymentResponse.fromJson(json),
    );
  }

  @override
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
  }) async {
    final Map<String, dynamic> payload = {
      "fname": firstName,
      "lname": lastName,
      "date": date,
      "users_message": userMessage,
      "notice_of_privacy_practice": isPrivacyPractice,
      "patients_name": patientName,
      "representatives_name": repName,
      "service_taken_date": serviceDate,
      "relation_with_patient": relationship,
    };

    return _apiService.makeRequest(
      url: 'privacy',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> complianceForm({
    required String? patientName,
    required String? dob,
    required dynamic patientSignature,
    required String? patientDob,
    required dynamic repSignature,
    required String? repDate,
    required String? natureWithPatient,
  }) async {
    final patientSignatureFileName = patientSignature.toString().split('/').last;
    final patientSignatureMimeType =
        lookupMimeType(patientSignature.toString()) ?? 'application/octet-stream';

    final repSignatureFileName = repSignature.toString().split('/').last;
    final repSignatureMimeType =
        lookupMimeType(repSignatureFileName.toString()) ?? 'application/octet-stream';

    final Map<String, dynamic> payload = {
      "patients_name": patientName,
      "dob": dob,
      "patients_signature": await MultipartFile.fromFile(
        patientSignature.toString(),
        filename: patientSignatureFileName,
        contentType: MediaType.parse(patientSignatureMimeType),
      ),
      "patients_dob": patientDob,
      "representative_signature": await MultipartFile.fromFile(
        repSignature.toString(),
        filename: repSignatureFileName,
        contentType: MediaType.parse(repSignatureMimeType),
      ),
      "representative_dob": repDate,
      "nature_with_patient": natureWithPatient,
    };

    return _apiService.makeRequest(
      url: 'compliance',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }

   @override
  Future<Either<AppError, dynamic>> agreementForm({
    required String? userName,
    required String? patientName,
    required String? patientSignatureDate,
    required String? relationship,
  }) async {
    final Map<String, dynamic> payload = {
      "user_name": userName,
      "patients_name": patientName,
      "patients_signature_date": patientSignatureDate,
      "relationship": relationship,
    };

    return _apiService.makeRequest(
      url: 'financial-responsibility-aggreement',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }

  @override
  Future<Either<AppError, dynamic>> selfPaymentForm({
    required String? userName,
    required String? patientName,
    required String? patientSignatureDate,
  }) async {
    final Map<String, dynamic> payload = {
      "user_name": userName,
      "patients_name": patientName,
      "patients_signature_date": patientSignatureDate
    };

    return _apiService.makeRequest(
      url: 'agreement-for-self-payment',
      method: HttpMethod.post,
      data: payload,
      isFormData: true,
      fromJson: (data) => data,
    );
  }
}
