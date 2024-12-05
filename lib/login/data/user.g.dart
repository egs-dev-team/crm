// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      last_name: json['last_name'] as String?,
      is_active: json['is_active'] as bool?,
      is_superuser: json['is_superuser'] as bool?,
      is_staff: json['is_staff'] as bool?,
      date_joined: json['date_joined'] == null
          ? null
          : DateTime.parse(json['date_joined'] as String),
      last_login: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      date_of_birth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      date_of_start: json['date_of_start'] == null
          ? null
          : DateTime.parse(json['date_of_start'] as String),
      inn: json['inn'] as String?,
      snils: json['snils'] as String?,
      passport: json['passport'] as String?,
      post: json['post'] as String?,
      info_about_relocate: json['info_about_relocate'] as String?,
      attestation: json['attestation'] as String?,
      qualification: json['qualification'] as String?,
      retraining: json['retraining'] as String?,
      status: json['status'] as bool,
      is_dark: json['is_dark'] as bool?,
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toInt())
              .toList() ??
          const [],
      user_permissions: (json['user_permissions'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'last_name': instance.last_name,
      'is_active': instance.is_active,
      'is_superuser': instance.is_superuser,
      'is_staff': instance.is_staff,
      'date_joined': instance.date_joined?.toIso8601String(),
      'last_login': instance.last_login?.toIso8601String(),
      'phone': instance.phone,
      'address': instance.address,
      'date_of_birth': instance.date_of_birth?.toIso8601String(),
      'date_of_start': instance.date_of_start?.toIso8601String(),
      'inn': instance.inn,
      'snils': instance.snils,
      'passport': instance.passport,
      'post': instance.post,
      'info_about_relocate': instance.info_about_relocate,
      'attestation': instance.attestation,
      'qualification': instance.qualification,
      'retraining': instance.retraining,
      'status': instance.status,
      'is_dark': instance.is_dark,
      'groups': instance.groups,
      'user_permissions': instance.user_permissions,
    };
