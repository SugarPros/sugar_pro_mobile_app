class ProDashboardResponse {
  String? type;
  ProDashboardData? data;

  ProDashboardResponse({this.type, this.data});

  ProDashboardResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? ProDashboardData.fromJson(json['data']) : null;
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

class ProDashboardData {
  String? providerId;
  List<Patients>? patients;
  List<Appointments>? appointments;
  List<Chats>? chats;
  int? totalUnread;

  ProDashboardData(
      {this.providerId,
      this.patients,
      this.appointments,
      this.chats,
      this.totalUnread});

  ProDashboardData.fromJson(Map<String, dynamic> json) {
    providerId = json['provider_id'];
    if (json['patients'] != null) {
      patients = <Patients>[];
      json['patients'].forEach((v) {
        patients!.add(Patients.fromJson(v));
      });
    }
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
    if (json['chats'] != null) {
      chats = <Chats>[];
      json['chats'].forEach((v) {
        chats!.add(Chats.fromJson(v));
      });
    }
    totalUnread = json['total_unread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider_id'] = providerId;
    if (patients != null) {
      data['patients'] = patients!.map((v) => v.toJson()).toList();
    }
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    if (chats != null) {
      data['chats'] = chats!.map((v) => v.toJson()).toList();
    }
    data['total_unread'] = totalUnread;
    return data;
  }
}

class Patients {
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

  Patients(
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

  Patients.fromJson(Map<String, dynamic> json) {
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

  Appointments(
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

class Chats {
  int? id;
  String? patientId;
  String? name;
  String? prefixCode;
  String? mobile;
  String? email;
  String? forgetOtp;
  dynamic emailVerifiedAt;
  String? profilePicture;
  String? language;
  String? hippaConsent;
  dynamic dexcomAccessToken;
  dynamic dexcomRefreshToken;
  dynamic dexcomTokenExpiresAt;
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

  Chats(
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

  Chats.fromJson(Map<String, dynamic> json) {
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