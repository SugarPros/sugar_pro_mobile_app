class PatientNotificationResponse {
  String? type;
  List<PatNotifications>? notifications;
  String? profilePicture;

  PatientNotificationResponse({this.type, this.notifications, this.profilePicture});

  PatientNotificationResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['notifications'] != null) {
      notifications = <PatNotifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(PatNotifications.fromJson(v));
      });
    }
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (notifications != null) {
      data['notifications'] =
          notifications!.map((v) => v.toJson()).toList();
    }
    data['profile_picture'] = profilePicture;
    return data;
  }
}

class PatNotifications {
  int? id;
  String? userId;
  String? userType;
  String? notification;
  String? readStatus;
  Null readTime;
  String? createdAt;
  String? updatedAt;

  PatNotifications(
      {this.id,
      this.userId,
      this.userType,
      this.notification,
      this.readStatus,
      this.readTime,
      this.createdAt,
      this.updatedAt});

  PatNotifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userType = json['user_type'];
    notification = json['notification'];
    readStatus = json['read_status'];
    readTime = json['read_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['user_type'] = userType;
    data['notification'] = notification;
    data['read_status'] = readStatus;
    data['read_time'] = readTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
