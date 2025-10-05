import 'dart:convert';

class PatientAccountResponse {
  final String type;
  final List<AccountDetail> accountDetails;
  final String profilePicture;
  final List<String> streets;
  final List<String> cities;
  final List<String> states;
  final List<String> zipCodes;
  final List<String> prefixcode;
  final List<String> languages;

  PatientAccountResponse({
    required this.type,
    required this.accountDetails,
    required this.profilePicture,
    required this.streets,
    required this.cities,
    required this.states,
    required this.zipCodes,
    required this.prefixcode,
    required this.languages,
  });

  factory PatientAccountResponse.fromJson(Map<String, dynamic> json) {
    return PatientAccountResponse(
      type: json['type'],
      accountDetails: (json['accountDetails'] as List)
          .map((e) => AccountDetail.fromJson(e))
          .toList(),
      profilePicture: json['profile_picture'],
      streets: List<String>.from(jsonDecode(json['streets'])),
      cities: List<String>.from(jsonDecode(json['cities'])),
      states: List<String>.from(jsonDecode(json['states'])),
      zipCodes: List<String>.from(jsonDecode(json['zip_codes'])),
      prefixcode: List<String>.from(jsonDecode(json['prefixcode'])),
      languages: List<String>.from(jsonDecode(json['languages'])),
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "accountDetails": accountDetails.map((e) => e.toJson()).toList(),
        "profile_picture": profilePicture,
        "streets": streets,
        "cities": cities,
        "states": states,
        "zip_codes": zipCodes,
        "prefixcode": prefixcode,
        "languages": languages,
      };
}

class AccountDetail {
  final int id;
  final String userId;
  final String fname;
  final String mname;
  final String lname;
  final String dob;
  final String gender;
  final String email;
  final String phone;
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String medicareNumber;
  final String groupNumber;
  final String license;
  final String ssn;
  final String notificationType;
  final String emmergencyName;
  final String emmergencyRelationship;
  final String emmergencyPhone;
  final String insuranceProvider;
  final String insurancePlanNumber;
  final String insuranceGroupNumber;
  final String createdAt;
  final String updatedAt;

  AccountDetail({
    required this.id,
    required this.userId,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.dob,
    required this.gender,
    required this.email,
    required this.phone,
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.medicareNumber,
    required this.groupNumber,
    required this.license,
    required this.ssn,
    required this.notificationType,
    required this.emmergencyName,
    required this.emmergencyRelationship,
    required this.emmergencyPhone,
    required this.insuranceProvider,
    required this.insurancePlanNumber,
    required this.insuranceGroupNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AccountDetail.fromJson(Map<String, dynamic> json) {
    return AccountDetail(
      id: json['id'],
      userId: json['user_id'],
      fname: json['fname'],
      mname: json['mname'],
      lname: json['lname'],
      dob: json['dob'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
      medicareNumber: json['medicare_number'],
      groupNumber: json['group_number'],
      license: json['license'],
      ssn: json['ssn'],
      notificationType: json['notification_type'],
      emmergencyName: json['emmergency_name'],
      emmergencyRelationship: json['emmergency_relationship'],
      emmergencyPhone: json['emmergency_phone'],
      insuranceProvider: json['insurance_provider'],
      insurancePlanNumber: json['insurance_plan_number'],
      insuranceGroupNumber: json['insurance_group_number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "fname": fname,
        "mname": mname,
        "lname": lname,
        "dob": dob,
        "gender": gender,
        "email": email,
        "phone": phone,
        "street": street,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "medicare_number": medicareNumber,
        "group_number": groupNumber,
        "license": license,
        "ssn": ssn,
        "notification_type": notificationType,
        "emmergency_name": emmergencyName,
        "emmergency_relationship": emmergencyRelationship,
        "emmergency_phone": emmergencyPhone,
        "insurance_provider": insuranceProvider,
        "insurance_plan_number": insurancePlanNumber,
        "insurance_group_number": insuranceGroupNumber,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
