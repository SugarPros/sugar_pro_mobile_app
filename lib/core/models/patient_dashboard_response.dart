import 'dart:convert';

class PatientDashboardResponse {
  List<String>? _decodeList(dynamic raw) {
    if (raw == null) return null;
    if (raw is String) {
      try {
        return List<String>.from(jsonDecode(raw));
      } catch (_) {
        return null;
      }
    } else if (raw is List) {
      return List<String>.from(raw);
    }
    return null;
  }

  String? type;
  int? userID;
  String? patientId;
  String? userType;
  String? podName;
  int? totalUnread;
  String? userLang;
  String? consent;
  String? notificationMethod;
  List<String>? languages;
  List<Appointments>? appointments;
  List<ChatHistory>? chatHistory;

  PatientDashboardResponse({
    this.type,
    this.userID,
    this.patientId,
    this.userType,
    this.podName,
    this.totalUnread,
    this.userLang,
    this.consent,
    this.notificationMethod,
    this.languages,
    this.appointments,
    this.chatHistory,
  });

  PatientDashboardResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    userID = json['userID'];
    patientId = json['patient_id'];
    userType = json['userType'];
    podName = json['pod_name'];
    totalUnread = json['total_unread'];
    userLang = json['userLang'];
    consent = json['Consent'];
    notificationMethod = json['notificationMethod'];
    languages = _decodeList(json['languages']);
    
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
    if (json['chat_history'] != null) {
      chatHistory = <ChatHistory>[];
      json['chat_history'].forEach((v) {
        chatHistory!.add(ChatHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['userID'] = userID;
    data['patient_id'] = patientId;
    data['userType'] = userType;
    data['pod_name'] = podName;
    data['total_unread'] = totalUnread;
    data['userLang'] = userLang;
    data['Consent'] = consent;
    data['notificationMethod'] = notificationMethod;
    data['languages'] = languages;
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    if (chatHistory != null) {
      data['chat_history'] = chatHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Appointments {
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
  String? providerName;

  Appointments({
    this.id,
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
    this.updatedAt,
    this.providerName,
  });

  Appointments.fromJson(Map<String, dynamic> json) {
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
    providerName = json['provider_name'];
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
    data['provider_name'] = providerName;
    return data;
  }
}

class ChatHistory {
  int? id;
  String? sentBy;
  String? senderType;
  String? receivedBy;
  String? receiverType;
  String? status;
  String? messageType;
  String? mainMessage;
  String? createdAt;
  String? updatedAt;
  String? senderName;
  String? senderProfilePicture;
  String? receiverName;
  String? receiverProfilePicture;

  ChatHistory({
    this.id,
    this.sentBy,
    this.senderType,
    this.receivedBy,
    this.receiverType,
    this.status,
    this.messageType,
    this.mainMessage,
    this.createdAt,
    this.updatedAt,
    this.senderName,
    this.senderProfilePicture,
    this.receiverName,
    this.receiverProfilePicture,
  });

  ChatHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentBy = json['sent_by'];
    senderType = json['sender_type'];
    receivedBy = json['received_by'];
    receiverType = json['receiver_type'];
    status = json['status'];
    messageType = json['message_type'];
    mainMessage = json['main_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    senderName = json['sender_name'];
    senderProfilePicture = json['sender_profile_picture'];
    receiverName = json['receiver_name'];
    receiverProfilePicture = json['receiver_profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sent_by'] = sentBy;
    data['sender_type'] = senderType;
    data['received_by'] = receivedBy;
    data['receiver_type'] = receiverType;
    data['status'] = status;
    data['message_type'] = messageType;
    data['main_message'] = mainMessage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['sender_name'] = senderName;
    data['sender_profile_picture'] = senderProfilePicture;
    data['receiver_name'] = receiverName;
    data['receiver_profile_picture'] = receiverProfilePicture;
    return data;
  }
}
