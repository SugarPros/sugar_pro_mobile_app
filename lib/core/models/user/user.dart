import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:sugar_pros/core/utils/type_id.dart';


part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: TypeId.user, adapterName: 'UserAdapter')
class User with _$User {
  const factory User({
    @HiveField(0) String? customerId,
    @HiveField(1) String? bvn,
    @HiveField(2) String? nin,
    @HiveField(3) String? userName,
    @HiveField(4) String? fullName,
    @HiveField(5) String? lastName,
    @HiveField(6) String? firstName,
    @HiveField(7) String? middleName,
    @HiveField(8) String? email,
    String? fax,
    @HiveField(9) String? phoneNumber1,
    String? phoneNumber2,
    @HiveField(10) String? dateOfBirth,
    @HiveField(11) int? gender,
    String? maritalStatus,
    @HiveField(12) String? addressLine1,
    @HiveField(13) String? addressLine2,
    @HiveField(14) String? city,
    String? stateId,
    @HiveField(15) String? state,
    @HiveField(16) String? lgaId,
    @HiveField(17) String? lga,
    int? status,
    int? platform,
    @HiveField(18) bool? isFaceVerified,
    @HiveField(19) bool? isLimitRestricted,
    List? accounts,
    String? referralCode,
    @HiveField(20) String? id,
    String? createdBy,
    String? createdByIp,
    String? createdDate,
    String? modifiedBy,
    String? modifiedByIp,
    String? modifiedDate,
    bool? isDeleted,
    @HiveField(22) String? loginUsername,
    @HiveField(23) String? token,
    @HiveField(24) String? pin,
    @HiveField(25) String? refreshToken,
    @HiveField(26) String? image,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}