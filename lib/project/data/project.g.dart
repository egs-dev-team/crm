// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: (json['id'] as num?)?.toInt(),
      proj_type: json['proj_type'] as String?,
      name: json['name'] as String,
      reg_num: json['reg_num'] as String?,
      contract: json['contract'] as String?,
      date_creation: json['date_creation'] == null
          ? null
          : DateTime.parse(json['date_creation'] as String),
      date_notification: json['date_notification'] == null
          ? null
          : DateTime.parse(json['date_notification'] as String),
      object_type: json['object_type'] as String?,
      address: json['address'] as String?,
      contact: json['contact'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      seasoning: json['seasoning'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      is_archived: json['is_archived'] as bool?,
      project_to_user: (json['project_to_user'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proj_type': instance.proj_type,
      'name': instance.name,
      'reg_num': instance.reg_num,
      'contract': instance.contract,
      'date_creation': instance.date_creation?.toIso8601String(),
      'date_notification': instance.date_notification?.toIso8601String(),
      'object_type': instance.object_type,
      'address': instance.address,
      'contact': instance.contact,
      'phone': instance.phone,
      'email': instance.email,
      'status': instance.status,
      'seasoning': instance.seasoning,
      'cost': instance.cost,
      'is_archived': instance.is_archived,
      'project_to_user': instance.project_to_user,
    };
