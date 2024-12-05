// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalImpl _$$JournalImplFromJson(Map<String, dynamic> json) =>
    _$JournalImpl(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['projectId'] as num).toInt(),
      type: json['type'] as String,
      value: (json['value'] as num?)?.toDouble(),
      status: json['status'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$JournalImplToJson(_$JournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'type': instance.type,
      'value': instance.value,
      'status': instance.status,
      'date': instance.date?.toIso8601String(),
    };
