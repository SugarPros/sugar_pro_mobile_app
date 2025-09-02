class PatientRecordResponse {
  String? type;
  PatientRecordData? data;

  PatientRecordResponse({this.type, this.data});

  PatientRecordResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? PatientRecordData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PatientRecordData {
  List<PatientsList>? patientsList;
  List<UserDetails>? userDetails;

  PatientRecordData({this.patientsList, this.userDetails});

  PatientRecordData.fromJson(Map<String, dynamic> json) {
    if (json['patients'] != null) {
      patientsList = <PatientsList>[];
      json['patients'].forEach((v) {
        patientsList!.add(PatientsList.fromJson(v));
      });
    }
    if (json['user_details'] != null) {
      userDetails = <UserDetails>[];
      json['user_details'].forEach((v) {
        userDetails!.add(UserDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (patientsList != null) {
      data['patients'] = patientsList!.map((v) => v.toJson()).toList();
    }
    if (userDetails != null) {
      data['user_details'] = userDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientsList {
  int? id;
  String? patientId;
  String? name;
  String? prefixCode;
  String? mobile;
  String? email;
  String? forgetOtp;
  Null emailVerifiedAt;
  String? profilePicture;
  String? language;
  String? hippaConsent;
  Null dexcomAccessToken;
  Null dexcomRefreshToken;
  Null dexcomTokenExpiresAt;
  String? lastLoggedIn;
  String? lastActivity;
  String? createdAt;
  String? updatedAt;
  int? apiToken;

  PatientsList(
      {this.id,
      this.patientId,
      this.name,
      this.prefixCode,
      this.mobile,
      this.email,
      this.forgetOtp,
      this.emailVerifiedAt,
      this.profilePicture,
      this.language,
      this.hippaConsent,
      this.dexcomAccessToken,
      this.dexcomRefreshToken,
      this.dexcomTokenExpiresAt,
      this.lastLoggedIn,
      this.lastActivity,
      this.createdAt,
      this.updatedAt,
      this.apiToken});

  PatientsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    name = json['name'];
    prefixCode = json['prefix_code'];
    mobile = json['mobile'];
    email = json['email'];
    forgetOtp = json['forget_otp'];
    emailVerifiedAt = json['email_verified_at'];
    profilePicture = json['profile_picture'];
    language = json['language'];
    hippaConsent = json['hippa_consent'];
    dexcomAccessToken = json['dexcom_access_token'];
    dexcomRefreshToken = json['dexcom_refresh_token'];
    dexcomTokenExpiresAt = json['dexcom_token_expires_at'];
    lastLoggedIn = json['last_logged_in'];
    lastActivity = json['last_activity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patientId;
    data['name'] = name;
    data['prefix_code'] = prefixCode;
    data['mobile'] = mobile;
    data['email'] = email;
    data['forget_otp'] = forgetOtp;
    data['email_verified_at'] = emailVerifiedAt;
    data['profile_picture'] = profilePicture;
    data['language'] = language;
    data['hippa_consent'] = hippaConsent;
    data['dexcom_access_token'] = dexcomAccessToken;
    data['dexcom_refresh_token'] = dexcomRefreshToken;
    data['dexcom_token_expires_at'] = dexcomTokenExpiresAt;
    data['last_logged_in'] = lastLoggedIn;
    data['last_activity'] = lastActivity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['api_token'] = apiToken;
    return data;
  }
}

class UserDetails {
  int? id;
  String? userId;
  String? fname;
  String? mname;
  String? lname;
  String? dob;
  String? gender;
  String? email;
  String? phone;
  String? street;
  String? city;
  String? state;
  String? zipCode;
  String? medicareNumber;
  String? groupNumber;
  String? license;
  String? ssn;
  String? notificationType;
  String? emmergencyName;
  String? emmergencyRelationship;
  String? emmergencyPhone;
  String? insuranceProvider;
  String? insurancePlanNumber;
  String? insuranceGroupNumber;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.id,
      this.userId,
      this.fname,
      this.mname,
      this.lname,
      this.dob,
      this.gender,
      this.email,
      this.phone,
      this.street,
      this.city,
      this.state,
      this.zipCode,
      this.medicareNumber,
      this.groupNumber,
      this.license,
      this.ssn,
      this.notificationType,
      this.emmergencyName,
      this.emmergencyRelationship,
      this.emmergencyPhone,
      this.insuranceProvider,
      this.insurancePlanNumber,
      this.insuranceGroupNumber,
      this.createdAt,
      this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fname = json['fname'];
    mname = json['mname'];
    lname = json['lname'];
    dob = json['dob'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    medicareNumber = json['medicare_number'];
    groupNumber = json['group_number'];
    license = json['license'];
    ssn = json['ssn'];
    notificationType = json['notification_type'];
    emmergencyName = json['emmergency_name'];
    emmergencyRelationship = json['emmergency_relationship'];
    emmergencyPhone = json['emmergency_phone'];
    insuranceProvider = json['insurance_provider'];
    insurancePlanNumber = json['insurance_plan_number'];
    insuranceGroupNumber = json['insurance_group_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['fname'] = fname;
    data['mname'] = mname;
    data['lname'] = lname;
    data['dob'] = dob;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['medicare_number'] = medicareNumber;
    data['group_number'] = groupNumber;
    data['license'] = license;
    data['ssn'] = ssn;
    data['notification_type'] = notificationType;
    data['emmergency_name'] = emmergencyName;
    data['emmergency_relationship'] = emmergencyRelationship;
    data['emmergency_phone'] = emmergencyPhone;
    data['insurance_provider'] = insuranceProvider;
    data['insurance_plan_number'] = insurancePlanNumber;
    data['insurance_group_number'] = insuranceGroupNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
