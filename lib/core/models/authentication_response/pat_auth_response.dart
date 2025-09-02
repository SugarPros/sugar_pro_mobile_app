class PatAuthResponse {
  String? type;
  PatUser? patUser;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? message;

  PatAuthResponse(
      {this.type,
      this.patUser,
      this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.message});

  PatAuthResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    patUser = json['user'] != null ? PatUser.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (patUser != null) {
      data['user'] = patUser!.toJson();
    }
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    data['message'] = message;
    return data;
  }
}

class PatUser {
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

  PatUser(
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

  PatUser.fromJson(Map<String, dynamic> json) {
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
