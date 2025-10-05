class SelfPaymentResponse {
  String? type;
  List<SelfPayment>? selfPayment;

  SelfPaymentResponse({this.type, this.selfPayment});

  SelfPaymentResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      selfPayment = <SelfPayment>[];
      json['data'].forEach((v) {
        selfPayment!.add(SelfPayment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (selfPayment != null) {
      data['data'] = selfPayment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SelfPayment {
  int? id;
  String? userId;
  String? userName;
  String? patientsName;
  String? patientsSignatureDate;
  String? createdAt;
  String? updatedAt;

  SelfPayment(
      {this.id,
      this.userId,
      this.userName,
      this.patientsName,
      this.patientsSignatureDate,
      this.createdAt,
      this.updatedAt});

  SelfPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    patientsName = json['patients_name'];
    patientsSignatureDate = json['patients_signature_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['patients_name'] = patientsName;
    data['patients_signature_date'] = patientsSignatureDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
