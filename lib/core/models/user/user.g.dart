// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      customerId: fields[0] as String?,
      bvn: fields[1] as String?,
      nin: fields[2] as String?,
      userName: fields[3] as String?,
      fullName: fields[4] as String?,
      lastName: fields[5] as String?,
      firstName: fields[6] as String?,
      middleName: fields[7] as String?,
      email: fields[8] as String?,
      phoneNumber1: fields[9] as String?,
      dateOfBirth: fields[10] as String?,
      gender: fields[11] as int?,
      addressLine1: fields[12] as String?,
      addressLine2: fields[13] as String?,
      city: fields[14] as String?,
      state: fields[15] as String?,
      lgaId: fields[16] as String?,
      lga: fields[17] as String?,
      isFaceVerified: fields[18] as bool?,
      isLimitRestricted: fields[19] as bool?,
      id: fields[20] as String?,
      loginUsername: fields[22] as String?,
      token: fields[23] as String?,
      pin: fields[24] as String?,
      refreshToken: fields[25] as String?,
      image: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.customerId)
      ..writeByte(1)
      ..write(obj.bvn)
      ..writeByte(2)
      ..write(obj.nin)
      ..writeByte(3)
      ..write(obj.userName)
      ..writeByte(4)
      ..write(obj.fullName)
      ..writeByte(5)
      ..write(obj.lastName)
      ..writeByte(6)
      ..write(obj.firstName)
      ..writeByte(7)
      ..write(obj.middleName)
      ..writeByte(8)
      ..write(obj.email)
      ..writeByte(9)
      ..write(obj.phoneNumber1)
      ..writeByte(10)
      ..write(obj.dateOfBirth)
      ..writeByte(11)
      ..write(obj.gender)
      ..writeByte(12)
      ..write(obj.addressLine1)
      ..writeByte(13)
      ..write(obj.addressLine2)
      ..writeByte(14)
      ..write(obj.city)
      ..writeByte(15)
      ..write(obj.state)
      ..writeByte(16)
      ..write(obj.lgaId)
      ..writeByte(17)
      ..write(obj.lga)
      ..writeByte(18)
      ..write(obj.isFaceVerified)
      ..writeByte(19)
      ..write(obj.isLimitRestricted)
      ..writeByte(20)
      ..write(obj.id)
      ..writeByte(22)
      ..write(obj.loginUsername)
      ..writeByte(23)
      ..write(obj.token)
      ..writeByte(24)
      ..write(obj.pin)
      ..writeByte(25)
      ..write(obj.refreshToken)
      ..writeByte(26)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      customerId: json['customerId'] as String?,
      bvn: json['bvn'] as String?,
      nin: json['nin'] as String?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      email: json['email'] as String?,
      fax: json['fax'] as String?,
      phoneNumber1: json['phoneNumber1'] as String?,
      phoneNumber2: json['phoneNumber2'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      maritalStatus: json['maritalStatus'] as String?,
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
      city: json['city'] as String?,
      stateId: json['stateId'] as String?,
      state: json['state'] as String?,
      lgaId: json['lgaId'] as String?,
      lga: json['lga'] as String?,
      status: (json['status'] as num?)?.toInt(),
      platform: (json['platform'] as num?)?.toInt(),
      isFaceVerified: json['isFaceVerified'] as bool?,
      isLimitRestricted: json['isLimitRestricted'] as bool?,
      accounts: json['accounts'] as List<dynamic>?,
      referralCode: json['referralCode'] as String?,
      id: json['id'] as String?,
      createdBy: json['createdBy'] as String?,
      createdByIp: json['createdByIp'] as String?,
      createdDate: json['createdDate'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      modifiedByIp: json['modifiedByIp'] as String?,
      modifiedDate: json['modifiedDate'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      loginUsername: json['loginUsername'] as String?,
      token: json['token'] as String?,
      pin: json['pin'] as String?,
      refreshToken: json['refreshToken'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'bvn': instance.bvn,
      'nin': instance.nin,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'email': instance.email,
      'fax': instance.fax,
      'phoneNumber1': instance.phoneNumber1,
      'phoneNumber2': instance.phoneNumber2,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'maritalStatus': instance.maritalStatus,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'stateId': instance.stateId,
      'state': instance.state,
      'lgaId': instance.lgaId,
      'lga': instance.lga,
      'status': instance.status,
      'platform': instance.platform,
      'isFaceVerified': instance.isFaceVerified,
      'isLimitRestricted': instance.isLimitRestricted,
      'accounts': instance.accounts,
      'referralCode': instance.referralCode,
      'id': instance.id,
      'createdBy': instance.createdBy,
      'createdByIp': instance.createdByIp,
      'createdDate': instance.createdDate,
      'modifiedBy': instance.modifiedBy,
      'modifiedByIp': instance.modifiedByIp,
      'modifiedDate': instance.modifiedDate,
      'isDeleted': instance.isDeleted,
      'loginUsername': instance.loginUsername,
      'token': instance.token,
      'pin': instance.pin,
      'refreshToken': instance.refreshToken,
      'image': instance.image,
    };
