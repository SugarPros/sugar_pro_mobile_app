class ProAppointmentResponse {
  String? type;
  List<ProAppointments>? proAppointments;

  ProAppointmentResponse({this.type, this.proAppointments});

  ProAppointmentResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['data'] != null) {
      proAppointments = <ProAppointments>[];
      json['data'].forEach((v) {
        proAppointments!.add(ProAppointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (proAppointments != null) {
      data['data'] = proAppointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProAppointments {
  int? id;
  String? appointmentUid;
  String? fname;
  String? lname;
  String? email;
  String? patientId;
  String? date;
  String? time;
  String? insuranceCompany;
  String? policyholderName;
  String? policyId;
  String? groupNumber;
  String? insurancePlanType;
  String? chiefComplaint;
  String? symptomOnset;
  String? priorDiagnoses;
  String? currentMedications;
  String? allergies;
  String? pastSurgicalHistory;
  String? familyMedicalHistory;
  String? plan;
  String? insuranceCardFront;
  String? insuranceCardBack;
  String? meetLink;
  String? bookedBy;
  String? type;
  String? providerId;
  String? status;
  String? usersFullName;
  String? usersAddress;
  String? usersEmail;
  String? usersPhone;
  String? countryCode;
  String? stripeChargeId;
  String? paymentStatus;
  String? amount;
  String? currency;
  String? medicareStatus;
  String? createdAt;
  String? updatedAt;

  ProAppointments(
      {this.id,
      this.appointmentUid,
      this.fname,
      this.lname,
      this.email,
      this.patientId,
      this.date,
      this.time,
      this.insuranceCompany,
      this.policyholderName,
      this.policyId,
      this.groupNumber,
      this.insurancePlanType,
      this.chiefComplaint,
      this.symptomOnset,
      this.priorDiagnoses,
      this.currentMedications,
      this.allergies,
      this.pastSurgicalHistory,
      this.familyMedicalHistory,
      this.plan,
      this.insuranceCardFront,
      this.insuranceCardBack,
      this.meetLink,
      this.bookedBy,
      this.type,
      this.providerId,
      this.status,
      this.usersFullName,
      this.usersAddress,
      this.usersEmail,
      this.usersPhone,
      this.countryCode,
      this.stripeChargeId,
      this.paymentStatus,
      this.amount,
      this.currency,
      this.medicareStatus,
      this.createdAt,
      this.updatedAt});

  ProAppointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentUid = json['appointment_uid'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    patientId = json['patient_id'];
    date = json['date'];
    time = json['time'];
    insuranceCompany = json['insurance_company'];
    policyholderName = json['policyholder_name'];
    policyId = json['policy_id'];
    groupNumber = json['group_number'];
    insurancePlanType = json['insurance_plan_type'];
    chiefComplaint = json['chief_complaint'];
    symptomOnset = json['symptom_onset'];
    priorDiagnoses = json['prior_diagnoses'];
    currentMedications = json['current_medications'];
    allergies = json['allergies'];
    pastSurgicalHistory = json['past_surgical_history'];
    familyMedicalHistory = json['family_medical_history'];
    plan = json['plan'];
    insuranceCardFront = json['insurance_card_front'];
    insuranceCardBack = json['insurance_card_back'];
    meetLink = json['meet_link'];
    bookedBy = json['booked_by'];
    type = json['type'];
    providerId = json['provider_id'];
    status = json['status'];
    usersFullName = json['users_full_name'];
    usersAddress = json['users_address'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    countryCode = json['country_code'];
    stripeChargeId = json['stripe_charge_id'];
    paymentStatus = json['payment_status'];
    amount = json['amount'];
    currency = json['currency'];
    medicareStatus = json['medicare_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appointment_uid'] = appointmentUid;
    data['fname'] = fname;
    data['lname'] = lname;
    data['email'] = email;
    data['patient_id'] = patientId;
    data['date'] = date;
    data['time'] = time;
    data['insurance_company'] = insuranceCompany;
    data['policyholder_name'] = policyholderName;
    data['policy_id'] = policyId;
    data['group_number'] = groupNumber;
    data['insurance_plan_type'] = insurancePlanType;
    data['chief_complaint'] = chiefComplaint;
    data['symptom_onset'] = symptomOnset;
    data['prior_diagnoses'] = priorDiagnoses;
    data['current_medications'] = currentMedications;
    data['allergies'] = allergies;
    data['past_surgical_history'] = pastSurgicalHistory;
    data['family_medical_history'] = familyMedicalHistory;
    data['plan'] = plan;
    data['insurance_card_front'] = insuranceCardFront;
    data['insurance_card_back'] = insuranceCardBack;
    data['meet_link'] = meetLink;
    data['booked_by'] = bookedBy;
    data['type'] = type;
    data['provider_id'] = providerId;
    data['status'] = status;
    data['users_full_name'] = usersFullName;
    data['users_address'] = usersAddress;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['country_code'] = countryCode;
    data['stripe_charge_id'] = stripeChargeId;
    data['payment_status'] = paymentStatus;
    data['amount'] = amount;
    data['currency'] = currency;
    data['medicare_status'] = medicareStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
