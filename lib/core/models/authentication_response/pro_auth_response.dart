class ProAuthResponse {
  String? type;
  String? message;
  ProAuthData? authData;

  ProAuthResponse({this.type, this.message, this.authData});

  ProAuthResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    authData = json['data'] != null ? ProAuthData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    if (authData != null) {
      data['data'] = authData!.toJson();
    }
    return data;
  }
}

class ProAuthData {
  Provider? provider;
  String? token;
  String? tokenType;
  int? expiresIn;

  ProAuthData({this.provider, this.token, this.tokenType, this.expiresIn});

  ProAuthData.fromJson(Map<String, dynamic> json) {
    provider = json['provider'] != null
        ? Provider.fromJson(json['provider'])
        : null;
    token = json['token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}

class Provider {
  int? id;
  String? providerId;
  String? podName;
  String? providerRole;
  String? name;
  String? firstName;
  String? lastName;
  String? prefixCode;
  String? mobile;
  String? email;
  String? forgetOtp;
  String? emailVerifiedAt;
  String? profilePicture;
  String? aboutMe;
  String? language;
  String? lastLoggedIn;
  String? lastActivity;
  String? createdAt;
  String? updatedAt;

  Provider(
      {this.id,
      this.providerId,
      this.podName,
      this.providerRole,
      this.name,
      this.firstName,
      this.lastName,
      this.prefixCode,
      this.mobile,
      this.email,
      this.forgetOtp,
      this.emailVerifiedAt,
      this.profilePicture,
      this.aboutMe,
      this.language,
      this.lastLoggedIn,
      this.lastActivity,
      this.createdAt,
      this.updatedAt});

  Provider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['provider_id'];
    podName = json['pod_name'];
    providerRole = json['provider_role'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    prefixCode = json['prefix_code'];
    mobile = json['mobile'];
    email = json['email'];
    forgetOtp = json['forget_otp'];
    emailVerifiedAt = json['email_verified_at'];
    profilePicture = json['profile_picture'];
    aboutMe = json['about_me'];
    language = json['language'];
    lastLoggedIn = json['last_logged_in'];
    lastActivity = json['last_activity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['provider_id'] = providerId;
    data['pod_name'] = podName;
    data['provider_role'] = providerRole;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['prefix_code'] = prefixCode;
    data['mobile'] = mobile;
    data['email'] = email;
    data['forget_otp'] = forgetOtp;
    data['email_verified_at'] = emailVerifiedAt;
    data['profile_picture'] = profilePicture;
    data['about_me'] = aboutMe;
    data['language'] = language;
    data['last_logged_in'] = lastLoggedIn;
    data['last_activity'] = lastActivity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
