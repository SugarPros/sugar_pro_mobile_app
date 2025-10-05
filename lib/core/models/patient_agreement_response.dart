class PatientAgreementResponse {
  String? type;
  List<PatientAgreement>? patientAgreement;

  PatientAgreementResponse({this.type, this.patientAgreement});

  PatientAgreementResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      patientAgreement = <PatientAgreement>[];
      json['data'].forEach((v) {
        patientAgreement!.add(PatientAgreement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (patientAgreement != null) {
      data['data'] = patientAgreement!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientAgreement {
  int? id;
  String? userId;
  String? userName;
  String? patientsName;
  String? patientsSignatureDate;
  String? relationship;
  String? createdAt;
  String? updatedAt;

  PatientAgreement(
      {this.id,
      this.userId,
      this.userName,
      this.patientsName,
      this.patientsSignatureDate,
      this.relationship,
      this.createdAt,
      this.updatedAt});

  PatientAgreement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    patientsName = json['patients_name'];
    patientsSignatureDate = json['patients_signature_date'];
    relationship = json['relationship'];
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
    data['relationship'] = relationship;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
