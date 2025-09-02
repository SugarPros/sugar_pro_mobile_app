class RefreshTokenResponse {
  bool? success;
  Payload? payload;

  RefreshTokenResponse({this.success, this.payload});

  RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}

class Payload {
  String? email;
  String? userId;
  bool? isVerified;
  String? firstName;
  String? lastName;
  String? role;
  bool? isActive;
  String? customerId;
  String? phoneNumber;
  String? accessToken;

  Payload(
      {this.email,
      this.userId,
      this.isVerified,
      this.firstName,
      this.lastName,
      this.role,
      this.isActive,
      this.customerId,
      this.phoneNumber,
      this.accessToken});

  Payload.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userId = json['userId'];
    isVerified = json['isVerified'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    isActive = json['isActive'];
    customerId = json['customerId'];
    phoneNumber = json['phoneNumber'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['userId'] = userId;
    data['isVerified'] = isVerified;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['role'] = role;
    data['isActive'] = isActive;
    data['customerId'] = customerId;
    data['phoneNumber'] = phoneNumber;
    data['accessToken'] = accessToken;
    return data;
  }
}
