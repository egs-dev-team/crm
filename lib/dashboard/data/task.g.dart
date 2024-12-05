// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      author: (json['author'] as num).toInt(),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      completion: json['completion'] == null
          ? null
          : DateTime.parse(json['completion'] as String),
      done:
          json['done'] == null ? null : DateTime.parse(json['done'] as String),
      project: (json['project'] as num?)?.toInt(),
      task_to_user: (json['task_to_user'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      doc_name: json['doc_name'] as String?,
      doc: json['doc'] as String?,
      document: const FileConverter().fromJson(json['document'] as String?),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'description': instance.description,
      'author': instance.author,
      'created': instance.created?.toIso8601String(),
      'completion': instance.completion?.toIso8601String(),
      'done': instance.done?.toIso8601String(),
      'project': instance.project,
      'task_to_user': instance.task_to_user,
      'doc_name': instance.doc_name,
      'doc': instance.doc,
      'document': const FileConverter().toJson(instance.document),
    };
