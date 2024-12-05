import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:egs/login/data/user.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    int? id,
    String? proj_type,
    required String name,
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
    List<User>? project_to_user,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
