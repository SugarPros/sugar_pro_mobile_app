class QuestLabResponse {
  String? type;
  List<QuestLab>? questLab;

  QuestLabResponse({this.type, this.questLab});

  QuestLabResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['quest_lab'] != null) {
      questLab = <QuestLab>[];
      json['quest_lab'].forEach((v) {
        questLab!.add(QuestLab.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (questLab != null) {
      data['quest_lab'] = questLab!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestLab {
  int? id;
  String? noteByProviderId;
  String? appointmentUid;
  String? testName;
  String? testCode;
  String? category;
  String? specimenType;
  String? urgency;
  String? preferredLabLocation;
  String? date;
  String? time;
  String? patientName;
  String? patientId;
  String? clinicalNotes;
  String? patientPhoneNo;
  String? insuranceProvider;
  String? estimatedCost;
  String? createdAt;
  String? updatedAt;

  QuestLab(
      {this.id,
      this.noteByProviderId,
      this.appointmentUid,
      this.testName,
      this.testCode,
      this.category,
      this.specimenType,
      this.urgency,
      this.preferredLabLocation,
      this.date,
      this.time,
      this.patientName,
      this.patientId,
      this.clinicalNotes,
      this.patientPhoneNo,
      this.insuranceProvider,
      this.estimatedCost,
      this.createdAt,
      this.updatedAt});

  QuestLab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noteByProviderId = json['note_by_provider_id'];
    appointmentUid = json['appointment_uid'];
    testName = json['test_name'];
    testCode = json['test_code'];
    category = json['category'];
    specimenType = json['specimen_type'];
    urgency = json['urgency'];
    preferredLabLocation = json['preferred_lab_location'];
    date = json['date'];
    time = json['time'];
    patientName = json['patient_name'];
    patientId = json['patient_id'];
    clinicalNotes = json['clinical_notes'];
    patientPhoneNo = json['patient_phone_no'];
    insuranceProvider = json['insurance_provider'];
    estimatedCost = json['estimated_cost'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['note_by_provider_id'] = noteByProviderId;
    data['appointment_uid'] = appointmentUid;
    data['test_name'] = testName;
    data['test_code'] = testCode;
    data['category'] = category;
    data['specimen_type'] = specimenType;
    data['urgency'] = urgency;
    data['preferred_lab_location'] = preferredLabLocation;
    data['date'] = date;
    data['time'] = time;
    data['patient_name'] = patientName;
    data['patient_id'] = patientId;
    data['clinical_notes'] = clinicalNotes;
    data['patient_phone_no'] = patientPhoneNo;
    data['insurance_provider'] = insuranceProvider;
    data['estimated_cost'] = estimatedCost;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
