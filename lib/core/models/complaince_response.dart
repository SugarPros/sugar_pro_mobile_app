class ComplianceResponse {
  String? type;
  List<Compliance>? complaince;

  ComplianceResponse({this.type, this.complaince});

  ComplianceResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      complaince = <Compliance>[];
      json['data'].forEach((v) {
        complaince!.add(Compliance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (complaince != null) {
      data['data'] = complaince!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Compliance {
  int? id;
  String? userId;
  String? patientsName;
  String? dob;
  String? patientsSignature;
  String? patientsDob;
  String? representativeSignature;
  String? representativeDob;
  String? natureWithPatient;
  String? createdAt;
  String? updatedAt;

  Compliance(
      {this.id,
      this.userId,
      this.patientsName,
      this.dob,
      this.patientsSignature,
      this.patientsDob,
      this.representativeSignature,
      this.representativeDob,
      this.natureWithPatient,
      this.createdAt,
      this.updatedAt});

  Compliance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    patientsName = json['patients_name'];
    dob = json['dob'];
    patientsSignature = json['patients_signature'];
    patientsDob = json['patients_dob'];
    representativeSignature = json['representative_signature'];
    representativeDob = json['representative_dob'];
    natureWithPatient = json['nature_with_patient'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['patients_name'] = patientsName;
    data['dob'] = dob;
    data['patients_signature'] = patientsSignature;
    data['patients_dob'] = patientsDob;
    data['representative_signature'] = representativeSignature;
    data['representative_dob'] = representativeDob;
    data['nature_with_patient'] = natureWithPatient;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
