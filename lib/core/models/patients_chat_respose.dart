class PatientChatListResponse {
  String? type;
  PatientsChatListData? data;

  PatientChatListResponse({this.type, this.data});

  PatientChatListResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? PatientsChatListData.fromJson(json['data']) : null;
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

class PatientsChatListData {
  List<PatientsChatItem>? chats;
  int? totalUnread;

  PatientsChatListData({this.chats, this.totalUnread});

  PatientsChatListData.fromJson(Map<String, dynamic> json) {
    if (json['chats'] != null) {
      chats = <PatientsChatItem>[];
      json['chats'].forEach((v) {
        chats!.add(PatientsChatItem.fromJson(v));
      });
    }
    totalUnread = json['total_unread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chats != null) {
      data['chats'] = chats!.map((v) => v.toJson()).toList();
    }
    data['total_unread'] = totalUnread;
    return data;
  }
}

class PatientsChatItem {
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
  String? latestMessage;
  String? messageTime;
  String? messageType;
  bool? isSender;
  String? messageStatus;
  int? unreadCount;
  int? apiToken;

  PatientsChatItem(
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
      this.latestMessage,
      this.messageTime,
      this.messageType,
      this.isSender,
      this.messageStatus,
      this.unreadCount,
      this.apiToken});

  PatientsChatItem.fromJson(Map<String, dynamic> json) {
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
    latestMessage = json['latest_message'];
    messageTime = json['message_time'];
    messageType = json['message_type'];
    isSender = json['is_sender'];
    messageStatus = json['message_status'];
    unreadCount = json['unread_count'];
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
    data['latest_message'] = latestMessage;
    data['message_time'] = messageTime;
    data['message_type'] = messageType;
    data['is_sender'] = isSender;
    data['message_status'] = messageStatus;
    data['unread_count'] = unreadCount;
    data['api_token'] = apiToken;
    return data;
  }
}
