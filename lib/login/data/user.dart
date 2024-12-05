import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart'; 

@freezed
class User with _$User {
  const factory User({
    int? id,
    required String email,
    required String name,
    required String surname,
    String? last_name,
    bool? is_active,
    bool? is_superuser,
    bool? is_staff,
    DateTime? date_joined,
    DateTime? last_login,
    String? phone,
    String? address,
    DateTime? date_of_birth,
    DateTime? date_of_start,
    String? inn,
    String? snils,
    String? passport,
    String? post,
    String? info_about_relocate,
    String? attestation,
    String? qualification,
    String? retraining,
    required bool status,
    bool? is_dark,
    @Default([]) List<int?> groups,
    @Default([]) List<int?> user_permissions, 
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
