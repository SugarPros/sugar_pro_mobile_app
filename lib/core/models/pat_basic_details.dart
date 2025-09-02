import 'dart:convert';

class PatBasicDetails {
  String? type;
  PatBasicData? data;

  PatBasicDetails({this.type, this.data});

  PatBasicDetails.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? PatBasicData.fromJson(json['data']) : null;
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

class PatBasicData {
  String? fname;
  String? mname;
  String? lname;
  String? dob;
  String? gender;
  String? email;
  String? phone;
  String? street;
  String? city;
  String? state;
  String? zipCode;
  String? medicareNumber;
  String? groupNumber;
  String? license;
  String? ssn;
  String? notificationType;
  List<String>? webStreets;
  List<String>? webCities;
  List<String>? webStates;
  List<String>? webZipCodes;

  PatBasicData({
    this.fname,
    this.mname,
    this.lname,
    this.dob,
    this.gender,
    this.email,
    this.phone,
    this.street,
    this.city,
    this.state,
    this.zipCode,
    this.medicareNumber,
    this.groupNumber,
    this.license,
    this.ssn,
    this.notificationType,
    this.webStreets,
    this.webCities,
    this.webStates,
    this.webZipCodes,
  });

  PatBasicData.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    mname = json['mname'];
    lname = json['lname'];
    dob = json['dob'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    medicareNumber = json['medicare_number'];
    groupNumber = json['group_number'];
    license = json['license'];
    ssn = json['ssn'];
    notificationType = json['notification_type'];

    webStreets = _decodeList(json['web_streets']);
    webCities = _decodeList(json['web_cities']);
    webStates = _decodeList(json['web_states']);
    webZipCodes = _decodeList(json['web_zip_codes']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fname'] = fname;
    data['mname'] = mname;
    data['lname'] = lname;
    data['dob'] = dob;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['zip_code'] = zipCode;
    data['medicare_number'] = medicareNumber;
    data['group_number'] = groupNumber;
    data['license'] = license;
    data['ssn'] = ssn;
    data['notification_type'] = notificationType;
    data['web_streets'] = webStreets;
    data['web_cities'] = webCities;
    data['web_states'] = webStates;
    data['web_zip_codes'] = webZipCodes;
    return data;
  }

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
}
