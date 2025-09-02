// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  String? get customerId => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get bvn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get nin => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get userName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get fullName => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get middleName => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get email => throw _privateConstructorUsedError;
  String? get fax => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get phoneNumber1 => throw _privateConstructorUsedError;
  String? get phoneNumber2 => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @HiveField(11)
  int? get gender => throw _privateConstructorUsedError;
  String? get maritalStatus => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get addressLine1 => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get addressLine2 => throw _privateConstructorUsedError;
  @HiveField(14)
  String? get city => throw _privateConstructorUsedError;
  String? get stateId => throw _privateConstructorUsedError;
  @HiveField(15)
  String? get state => throw _privateConstructorUsedError;
  @HiveField(16)
  String? get lgaId => throw _privateConstructorUsedError;
  @HiveField(17)
  String? get lga => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int? get platform => throw _privateConstructorUsedError;
  @HiveField(18)
  bool? get isFaceVerified => throw _privateConstructorUsedError;
  @HiveField(19)
  bool? get isLimitRestricted => throw _privateConstructorUsedError;
  List<dynamic>? get accounts => throw _privateConstructorUsedError;
  String? get referralCode => throw _privateConstructorUsedError;
  @HiveField(20)
  String? get id => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  String? get createdByIp => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  String? get modifiedBy => throw _privateConstructorUsedError;
  String? get modifiedByIp => throw _privateConstructorUsedError;
  String? get modifiedDate => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  @HiveField(22)
  String? get loginUsername => throw _privateConstructorUsedError;
  @HiveField(23)
  String? get token => throw _privateConstructorUsedError;
  @HiveField(24)
  String? get pin => throw _privateConstructorUsedError;
  @HiveField(25)
  String? get refreshToken => throw _privateConstructorUsedError;
  @HiveField(26)
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) String? customerId,
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
      List<dynamic>? accounts,
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
      @HiveField(26) String? image});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? bvn = freezed,
    Object? nin = freezed,
    Object? userName = freezed,
    Object? fullName = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? email = freezed,
    Object? fax = freezed,
    Object? phoneNumber1 = freezed,
    Object? phoneNumber2 = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? maritalStatus = freezed,
    Object? addressLine1 = freezed,
    Object? addressLine2 = freezed,
    Object? city = freezed,
    Object? stateId = freezed,
    Object? state = freezed,
    Object? lgaId = freezed,
    Object? lga = freezed,
    Object? status = freezed,
    Object? platform = freezed,
    Object? isFaceVerified = freezed,
    Object? isLimitRestricted = freezed,
    Object? accounts = freezed,
    Object? referralCode = freezed,
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? createdByIp = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedByIp = freezed,
    Object? modifiedDate = freezed,
    Object? isDeleted = freezed,
    Object? loginUsername = freezed,
    Object? token = freezed,
    Object? pin = freezed,
    Object? refreshToken = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      bvn: freezed == bvn
          ? _value.bvn
          : bvn // ignore: cast_nullable_to_non_nullable
              as String?,
      nin: freezed == nin
          ? _value.nin
          : nin // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber1: freezed == phoneNumber1
          ? _value.phoneNumber1
          : phoneNumber1 // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber2: freezed == phoneNumber2
          ? _value.phoneNumber2
          : phoneNumber2 // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      lgaId: freezed == lgaId
          ? _value.lgaId
          : lgaId // ignore: cast_nullable_to_non_nullable
              as String?,
      lga: freezed == lga
          ? _value.lga
          : lga // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as int?,
      isFaceVerified: freezed == isFaceVerified
          ? _value.isFaceVerified
          : isFaceVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLimitRestricted: freezed == isLimitRestricted
          ? _value.isLimitRestricted
          : isLimitRestricted // ignore: cast_nullable_to_non_nullable
              as bool?,
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByIp: freezed == createdByIp
          ? _value.createdByIp
          : createdByIp // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedByIp: freezed == modifiedByIp
          ? _value.modifiedByIp
          : modifiedByIp // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginUsername: freezed == loginUsername
          ? _value.loginUsername
          : loginUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? customerId,
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
      List<dynamic>? accounts,
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
      @HiveField(26) String? image});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? bvn = freezed,
    Object? nin = freezed,
    Object? userName = freezed,
    Object? fullName = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? email = freezed,
    Object? fax = freezed,
    Object? phoneNumber1 = freezed,
    Object? phoneNumber2 = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? maritalStatus = freezed,
    Object? addressLine1 = freezed,
    Object? addressLine2 = freezed,
    Object? city = freezed,
    Object? stateId = freezed,
    Object? state = freezed,
    Object? lgaId = freezed,
    Object? lga = freezed,
    Object? status = freezed,
    Object? platform = freezed,
    Object? isFaceVerified = freezed,
    Object? isLimitRestricted = freezed,
    Object? accounts = freezed,
    Object? referralCode = freezed,
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? createdByIp = freezed,
    Object? createdDate = freezed,
    Object? modifiedBy = freezed,
    Object? modifiedByIp = freezed,
    Object? modifiedDate = freezed,
    Object? isDeleted = freezed,
    Object? loginUsername = freezed,
    Object? token = freezed,
    Object? pin = freezed,
    Object? refreshToken = freezed,
    Object? image = freezed,
  }) {
    return _then(_$UserImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      bvn: freezed == bvn
          ? _value.bvn
          : bvn // ignore: cast_nullable_to_non_nullable
              as String?,
      nin: freezed == nin
          ? _value.nin
          : nin // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber1: freezed == phoneNumber1
          ? _value.phoneNumber1
          : phoneNumber1 // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber2: freezed == phoneNumber2
          ? _value.phoneNumber2
          : phoneNumber2 // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      maritalStatus: freezed == maritalStatus
          ? _value.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      stateId: freezed == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      lgaId: freezed == lgaId
          ? _value.lgaId
          : lgaId // ignore: cast_nullable_to_non_nullable
              as String?,
      lga: freezed == lga
          ? _value.lga
          : lga // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as int?,
      isFaceVerified: freezed == isFaceVerified
          ? _value.isFaceVerified
          : isFaceVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLimitRestricted: freezed == isLimitRestricted
          ? _value.isLimitRestricted
          : isLimitRestricted // ignore: cast_nullable_to_non_nullable
              as bool?,
      accounts: freezed == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      referralCode: freezed == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByIp: freezed == createdByIp
          ? _value.createdByIp
          : createdByIp // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedByIp: freezed == modifiedByIp
          ? _value.modifiedByIp
          : modifiedByIp // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      loginUsername: freezed == loginUsername
          ? _value.loginUsername
          : loginUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      pin: freezed == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@HiveField(0) this.customerId,
      @HiveField(1) this.bvn,
      @HiveField(2) this.nin,
      @HiveField(3) this.userName,
      @HiveField(4) this.fullName,
      @HiveField(5) this.lastName,
      @HiveField(6) this.firstName,
      @HiveField(7) this.middleName,
      @HiveField(8) this.email,
      this.fax,
      @HiveField(9) this.phoneNumber1,
      this.phoneNumber2,
      @HiveField(10) this.dateOfBirth,
      @HiveField(11) this.gender,
      this.maritalStatus,
      @HiveField(12) this.addressLine1,
      @HiveField(13) this.addressLine2,
      @HiveField(14) this.city,
      this.stateId,
      @HiveField(15) this.state,
      @HiveField(16) this.lgaId,
      @HiveField(17) this.lga,
      this.status,
      this.platform,
      @HiveField(18) this.isFaceVerified,
      @HiveField(19) this.isLimitRestricted,
      final List<dynamic>? accounts,
      this.referralCode,
      @HiveField(20) this.id,
      this.createdBy,
      this.createdByIp,
      this.createdDate,
      this.modifiedBy,
      this.modifiedByIp,
      this.modifiedDate,
      this.isDeleted,
      @HiveField(22) this.loginUsername,
      @HiveField(23) this.token,
      @HiveField(24) this.pin,
      @HiveField(25) this.refreshToken,
      @HiveField(26) this.image})
      : _accounts = accounts;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @HiveField(0)
  final String? customerId;
  @override
  @HiveField(1)
  final String? bvn;
  @override
  @HiveField(2)
  final String? nin;
  @override
  @HiveField(3)
  final String? userName;
  @override
  @HiveField(4)
  final String? fullName;
  @override
  @HiveField(5)
  final String? lastName;
  @override
  @HiveField(6)
  final String? firstName;
  @override
  @HiveField(7)
  final String? middleName;
  @override
  @HiveField(8)
  final String? email;
  @override
  final String? fax;
  @override
  @HiveField(9)
  final String? phoneNumber1;
  @override
  final String? phoneNumber2;
  @override
  @HiveField(10)
  final String? dateOfBirth;
  @override
  @HiveField(11)
  final int? gender;
  @override
  final String? maritalStatus;
  @override
  @HiveField(12)
  final String? addressLine1;
  @override
  @HiveField(13)
  final String? addressLine2;
  @override
  @HiveField(14)
  final String? city;
  @override
  final String? stateId;
  @override
  @HiveField(15)
  final String? state;
  @override
  @HiveField(16)
  final String? lgaId;
  @override
  @HiveField(17)
  final String? lga;
  @override
  final int? status;
  @override
  final int? platform;
  @override
  @HiveField(18)
  final bool? isFaceVerified;
  @override
  @HiveField(19)
  final bool? isLimitRestricted;
  final List<dynamic>? _accounts;
  @override
  List<dynamic>? get accounts {
    final value = _accounts;
    if (value == null) return null;
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? referralCode;
  @override
  @HiveField(20)
  final String? id;
  @override
  final String? createdBy;
  @override
  final String? createdByIp;
  @override
  final String? createdDate;
  @override
  final String? modifiedBy;
  @override
  final String? modifiedByIp;
  @override
  final String? modifiedDate;
  @override
  final bool? isDeleted;
  @override
  @HiveField(22)
  final String? loginUsername;
  @override
  @HiveField(23)
  final String? token;
  @override
  @HiveField(24)
  final String? pin;
  @override
  @HiveField(25)
  final String? refreshToken;
  @override
  @HiveField(26)
  final String? image;

  @override
  String toString() {
    return 'User(customerId: $customerId, bvn: $bvn, nin: $nin, userName: $userName, fullName: $fullName, lastName: $lastName, firstName: $firstName, middleName: $middleName, email: $email, fax: $fax, phoneNumber1: $phoneNumber1, phoneNumber2: $phoneNumber2, dateOfBirth: $dateOfBirth, gender: $gender, maritalStatus: $maritalStatus, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, stateId: $stateId, state: $state, lgaId: $lgaId, lga: $lga, status: $status, platform: $platform, isFaceVerified: $isFaceVerified, isLimitRestricted: $isLimitRestricted, accounts: $accounts, referralCode: $referralCode, id: $id, createdBy: $createdBy, createdByIp: $createdByIp, createdDate: $createdDate, modifiedBy: $modifiedBy, modifiedByIp: $modifiedByIp, modifiedDate: $modifiedDate, isDeleted: $isDeleted, loginUsername: $loginUsername, token: $token, pin: $pin, refreshToken: $refreshToken, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.bvn, bvn) || other.bvn == bvn) &&
            (identical(other.nin, nin) || other.nin == nin) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.phoneNumber1, phoneNumber1) ||
                other.phoneNumber1 == phoneNumber1) &&
            (identical(other.phoneNumber2, phoneNumber2) ||
                other.phoneNumber2 == phoneNumber2) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.lgaId, lgaId) || other.lgaId == lgaId) &&
            (identical(other.lga, lga) || other.lga == lga) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.isFaceVerified, isFaceVerified) ||
                other.isFaceVerified == isFaceVerified) &&
            (identical(other.isLimitRestricted, isLimitRestricted) ||
                other.isLimitRestricted == isLimitRestricted) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByIp, createdByIp) ||
                other.createdByIp == createdByIp) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.modifiedByIp, modifiedByIp) ||
                other.modifiedByIp == modifiedByIp) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.loginUsername, loginUsername) ||
                other.loginUsername == loginUsername) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerId,
        bvn,
        nin,
        userName,
        fullName,
        lastName,
        firstName,
        middleName,
        email,
        fax,
        phoneNumber1,
        phoneNumber2,
        dateOfBirth,
        gender,
        maritalStatus,
        addressLine1,
        addressLine2,
        city,
        stateId,
        state,
        lgaId,
        lga,
        status,
        platform,
        isFaceVerified,
        isLimitRestricted,
        const DeepCollectionEquality().hash(_accounts),
        referralCode,
        id,
        createdBy,
        createdByIp,
        createdDate,
        modifiedBy,
        modifiedByIp,
        modifiedDate,
        isDeleted,
        loginUsername,
        token,
        pin,
        refreshToken,
        image
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@HiveField(0) final String? customerId,
      @HiveField(1) final String? bvn,
      @HiveField(2) final String? nin,
      @HiveField(3) final String? userName,
      @HiveField(4) final String? fullName,
      @HiveField(5) final String? lastName,
      @HiveField(6) final String? firstName,
      @HiveField(7) final String? middleName,
      @HiveField(8) final String? email,
      final String? fax,
      @HiveField(9) final String? phoneNumber1,
      final String? phoneNumber2,
      @HiveField(10) final String? dateOfBirth,
      @HiveField(11) final int? gender,
      final String? maritalStatus,
      @HiveField(12) final String? addressLine1,
      @HiveField(13) final String? addressLine2,
      @HiveField(14) final String? city,
      final String? stateId,
      @HiveField(15) final String? state,
      @HiveField(16) final String? lgaId,
      @HiveField(17) final String? lga,
      final int? status,
      final int? platform,
      @HiveField(18) final bool? isFaceVerified,
      @HiveField(19) final bool? isLimitRestricted,
      final List<dynamic>? accounts,
      final String? referralCode,
      @HiveField(20) final String? id,
      final String? createdBy,
      final String? createdByIp,
      final String? createdDate,
      final String? modifiedBy,
      final String? modifiedByIp,
      final String? modifiedDate,
      final bool? isDeleted,
      @HiveField(22) final String? loginUsername,
      @HiveField(23) final String? token,
      @HiveField(24) final String? pin,
      @HiveField(25) final String? refreshToken,
      @HiveField(26) final String? image}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @HiveField(0)
  String? get customerId;
  @override
  @HiveField(1)
  String? get bvn;
  @override
  @HiveField(2)
  String? get nin;
  @override
  @HiveField(3)
  String? get userName;
  @override
  @HiveField(4)
  String? get fullName;
  @override
  @HiveField(5)
  String? get lastName;
  @override
  @HiveField(6)
  String? get firstName;
  @override
  @HiveField(7)
  String? get middleName;
  @override
  @HiveField(8)
  String? get email;
  @override
  String? get fax;
  @override
  @HiveField(9)
  String? get phoneNumber1;
  @override
  String? get phoneNumber2;
  @override
  @HiveField(10)
  String? get dateOfBirth;
  @override
  @HiveField(11)
  int? get gender;
  @override
  String? get maritalStatus;
  @override
  @HiveField(12)
  String? get addressLine1;
  @override
  @HiveField(13)
  String? get addressLine2;
  @override
  @HiveField(14)
  String? get city;
  @override
  String? get stateId;
  @override
  @HiveField(15)
  String? get state;
  @override
  @HiveField(16)
  String? get lgaId;
  @override
  @HiveField(17)
  String? get lga;
  @override
  int? get status;
  @override
  int? get platform;
  @override
  @HiveField(18)
  bool? get isFaceVerified;
  @override
  @HiveField(19)
  bool? get isLimitRestricted;
  @override
  List<dynamic>? get accounts;
  @override
  String? get referralCode;
  @override
  @HiveField(20)
  String? get id;
  @override
  String? get createdBy;
  @override
  String? get createdByIp;
  @override
  String? get createdDate;
  @override
  String? get modifiedBy;
  @override
  String? get modifiedByIp;
  @override
  String? get modifiedDate;
  @override
  bool? get isDeleted;
  @override
  @HiveField(22)
  String? get loginUsername;
  @override
  @HiveField(23)
  String? get token;
  @override
  @HiveField(24)
  String? get pin;
  @override
  @HiveField(25)
  String? get refreshToken;
  @override
  @HiveField(26)
  String? get image;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
