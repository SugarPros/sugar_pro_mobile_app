class PrivacyResponse {
  String? type;
  List<Privacy>? privacy;

  PrivacyResponse({this.type, this.privacy});

  PrivacyResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      privacy = <Privacy>[];
      json['data'].forEach((v) {
        privacy!.add(Privacy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (privacy != null) {
      data['data'] = privacy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Privacy {
  int? id;
  String? userId;
  String? fname;
  String? lname;
  String? date;
  String? usersMessage;
  String? noticeOfPrivacyPractice;
  String? patientsName;
  String? representativesName;
  String? serviceTakenDate;
  String? relationWithPatient;
  Null createdAt;
  String? updatedAt;

  Privacy(
      {this.id,
      this.userId,
      this.fname,
      this.lname,
      this.date,
      this.usersMessage,
      this.noticeOfPrivacyPractice,
      this.patientsName,
      this.representativesName,
      this.serviceTakenDate,
      this.relationWithPatient,
      this.createdAt,
      this.updatedAt});

  Privacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fname = json['fname'];
    lname = json['lname'];
    date = json['date'];
    usersMessage = json['users_message'];
    noticeOfPrivacyPractice = json['notice_of_privacy_practice'];
    patientsName = json['patients_name'];
    representativesName = json['representatives_name'];
    serviceTakenDate = json['service_taken_date'];
    relationWithPatient = json['relation_with_patient'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['fname'] = fname;
    data['lname'] = lname;
    data['date'] = date;
    data['users_message'] = usersMessage;
    data['notice_of_privacy_practice'] = noticeOfPrivacyPractice;
    data['patients_name'] = patientsName;
    data['representatives_name'] = representativesName;
    data['service_taken_date'] = serviceTakenDate;
    data['relation_with_patient'] = relationWithPatient;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
