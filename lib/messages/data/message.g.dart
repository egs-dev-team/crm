// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: (json['id'] as num?)?.toInt(),
      message: json['message'] as String?,
      author: (json['author'] as num).toInt(),
      task: (json['task'] as num?)?.toInt(),
      mail: (json['mail'] as num?)?.toInt(),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      doc: const FileConverter().fromJson(json['doc'] as String?),
      docName: json['docName'] as String?,
      docBase64: json['docBase64'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'author': instance.author,
      'task': instance.task,
      'mail': instance.mail,
      'created': instance.created?.toIso8601String(),
      'doc': const FileConverter().toJson(instance.doc),
      'docName': instance.docName,
      'docBase64': instance.docBase64,
    };
