// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  int? get id => throw _privateConstructorUsedError;
  String? get proj_type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get reg_num => throw _privateConstructorUsedError;
  String? get contract => throw _privateConstructorUsedError;
  DateTime? get date_creation => throw _privateConstructorUsedError;
  DateTime? get date_notification => throw _privateConstructorUsedError;
  String? get object_type => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get contact => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get seasoning => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  bool? get is_archived => throw _privateConstructorUsedError;
  List<User>? get project_to_user => throw _privateConstructorUsedError;

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
  @useResult
  $Res call(
      {int? id,
      String? proj_type,
      String name,
      String? reg_num,
      String? contract,
      DateTime? date_creation,
      DateTime? date_notification,
      String? object_type,
      String? address,
      String? contact,
      String? phone,
      String? email,
      String? status,
      String? seasoning,
      double? cost,
      bool? is_archived,
      List<User>? project_to_user});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? proj_type = freezed,
    Object? name = null,
    Object? reg_num = freezed,
    Object? contract = freezed,
    Object? date_creation = freezed,
    Object? date_notification = freezed,
    Object? object_type = freezed,
    Object? address = freezed,
    Object? contact = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? status = freezed,
    Object? seasoning = freezed,
    Object? cost = freezed,
    Object? is_archived = freezed,
    Object? project_to_user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      proj_type: freezed == proj_type
          ? _value.proj_type
          : proj_type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      reg_num: freezed == reg_num
          ? _value.reg_num
          : reg_num // ignore: cast_nullable_to_non_nullable
              as String?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String?,
      date_creation: freezed == date_creation
          ? _value.date_creation
          : date_creation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date_notification: freezed == date_notification
          ? _value.date_notification
          : date_notification // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      object_type: freezed == object_type
          ? _value.object_type
          : object_type // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      seasoning: freezed == seasoning
          ? _value.seasoning
          : seasoning // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      is_archived: freezed == is_archived
          ? _value.is_archived
          : is_archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      project_to_user: freezed == project_to_user
          ? _value.project_to_user
          : project_to_user // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? proj_type,
      String name,
      String? reg_num,
      String? contract,
      DateTime? date_creation,
      DateTime? date_notification,
      String? object_type,
      String? address,
      String? contact,
      String? phone,
      String? email,
      String? status,
      String? seasoning,
      double? cost,
      bool? is_archived,
      List<User>? project_to_user});
}

/// @nodoc
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? proj_type = freezed,
    Object? name = null,
    Object? reg_num = freezed,
    Object? contract = freezed,
    Object? date_creation = freezed,
    Object? date_notification = freezed,
    Object? object_type = freezed,
    Object? address = freezed,
    Object? contact = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? status = freezed,
    Object? seasoning = freezed,
    Object? cost = freezed,
    Object? is_archived = freezed,
    Object? project_to_user = freezed,
  }) {
    return _then(_$ProjectImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      proj_type: freezed == proj_type
          ? _value.proj_type
          : proj_type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      reg_num: freezed == reg_num
          ? _value.reg_num
          : reg_num // ignore: cast_nullable_to_non_nullable
              as String?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String?,
      date_creation: freezed == date_creation
          ? _value.date_creation
          : date_creation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date_notification: freezed == date_notification
          ? _value.date_notification
          : date_notification // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      object_type: freezed == object_type
          ? _value.object_type
          : object_type // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      seasoning: freezed == seasoning
          ? _value.seasoning
          : seasoning // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      is_archived: freezed == is_archived
          ? _value.is_archived
          : is_archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      project_to_user: freezed == project_to_user
          ? _value._project_to_user
          : project_to_user // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
      {this.id,
      this.proj_type,
      required this.name,
      this.reg_num,
      this.contract,
      this.date_creation,
      this.date_notification,
      this.object_type,
      this.address,
      this.contact,
      this.phone,
      this.email,
      this.status,
      this.seasoning,
      this.cost,
      this.is_archived,
      final List<User>? project_to_user})
      : _project_to_user = project_to_user;

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

  @override
  final int? id;
  @override
  final String? proj_type;
  @override
  final String name;
  @override
  final String? reg_num;
  @override
  final String? contract;
  @override
  final DateTime? date_creation;
  @override
  final DateTime? date_notification;
  @override
  final String? object_type;
  @override
  final String? address;
  @override
  final String? contact;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? status;
  @override
  final String? seasoning;
  @override
  final double? cost;
  @override
  final bool? is_archived;
  final List<User>? _project_to_user;
  @override
  List<User>? get project_to_user {
    final value = _project_to_user;
    if (value == null) return null;
    if (_project_to_user is EqualUnmodifiableListView) return _project_to_user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Project(id: $id, proj_type: $proj_type, name: $name, reg_num: $reg_num, contract: $contract, date_creation: $date_creation, date_notification: $date_notification, object_type: $object_type, address: $address, contact: $contact, phone: $phone, email: $email, status: $status, seasoning: $seasoning, cost: $cost, is_archived: $is_archived, project_to_user: $project_to_user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.proj_type, proj_type) ||
                other.proj_type == proj_type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.reg_num, reg_num) || other.reg_num == reg_num) &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.date_creation, date_creation) ||
                other.date_creation == date_creation) &&
            (identical(other.date_notification, date_notification) ||
                other.date_notification == date_notification) &&
            (identical(other.object_type, object_type) ||
                other.object_type == object_type) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.seasoning, seasoning) ||
                other.seasoning == seasoning) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.is_archived, is_archived) ||
                other.is_archived == is_archived) &&
            const DeepCollectionEquality()
                .equals(other._project_to_user, _project_to_user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      proj_type,
      name,
      reg_num,
      contract,
      date_creation,
      date_notification,
      object_type,
      address,
      contact,
      phone,
      email,
      status,
      seasoning,
      cost,
      is_archived,
      const DeepCollectionEquality().hash(_project_to_user));

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {final int? id,
      final String? proj_type,
      required final String name,
      final String? reg_num,
      final String? contract,
      final DateTime? date_creation,
      final DateTime? date_notification,
      final String? object_type,
      final String? address,
      final String? contact,
      final String? phone,
      final String? email,
      final String? status,
      final String? seasoning,
      final double? cost,
      final bool? is_archived,
      final List<User>? project_to_user}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  int? get id;
  @override
  String? get proj_type;
  @override
  String get name;
  @override
  String? get reg_num;
  @override
  String? get contract;
  @override
  DateTime? get date_creation;
  @override
  DateTime? get date_notification;
  @override
  String? get object_type;
  @override
  String? get address;
  @override
  String? get contact;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get status;
  @override
  String? get seasoning;
  @override
  double? get cost;
  @override
  bool? get is_archived;
  @override
  List<User>? get project_to_user;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
