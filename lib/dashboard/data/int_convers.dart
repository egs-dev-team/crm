import 'package:freezed_annotation/freezed_annotation.dart';

class IntConverter implements JsonConverter<int?, String?> {
  const IntConverter();

  @override
  int? fromJson(String? json) {
    if (json == null) return null;
    return int.parse(json);
  }

  @override
  String? toJson(int? object) {
    return object?.toString();
  }
}
