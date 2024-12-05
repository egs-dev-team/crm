import 'dart:io';
import 'package:egs/messages/data/file_convert.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  factory Message({
    int? id,
    String? message,
    required int author,
    int? task,
    int? mail,
    DateTime? created,
    @FileConverter() File? doc,
    String? docName,
    String? docBase64,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
