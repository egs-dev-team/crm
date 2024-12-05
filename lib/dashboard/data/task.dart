import 'package:egs/messages/data/file_convert.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  factory Task({
    int? id,
    String? type,
    required String name,
    String? description,
    required int author,
    DateTime? created,
    DateTime? completion,
    DateTime? done,
    int? project,
    List<int>? task_to_user,
    String? doc_name,
    String? doc,
    @FileConverter() File? document,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
