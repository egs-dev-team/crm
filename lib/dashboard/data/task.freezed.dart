// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  int? get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get author => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  DateTime? get completion => throw _privateConstructorUsedError;
  DateTime? get done => throw _privateConstructorUsedError;
  int? get project => throw _privateConstructorUsedError;
  List<int>? get task_to_user => throw _privateConstructorUsedError;
  String? get doc_name => throw _privateConstructorUsedError;
  String? get doc => throw _privateConstructorUsedError;
  @FileConverter()
  File? get document => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {int? id,
      String? type,
      String name,
      String? description,
      int author,
      DateTime? created,
      DateTime? completion,
      DateTime? done,
      int? project,
      List<int>? task_to_user,
      String? doc_name,
      String? doc,
      @FileConverter() File? document});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? author = null,
    Object? created = freezed,
    Object? completion = freezed,
    Object? done = freezed,
    Object? project = freezed,
    Object? task_to_user = freezed,
    Object? doc_name = freezed,
    Object? doc = freezed,
    Object? document = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as int,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completion: freezed == completion
          ? _value.completion
          : completion // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as int?,
      task_to_user: freezed == task_to_user
          ? _value.task_to_user
          : task_to_user // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      doc_name: freezed == doc_name
          ? _value.doc_name
          : doc_name // ignore: cast_nullable_to_non_nullable
              as String?,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as String?,
      document: freezed == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? type,
      String name,
      String? description,
      int author,
      DateTime? created,
      DateTime? completion,
      DateTime? done,
      int? project,
      List<int>? task_to_user,
      String? doc_name,
      String? doc,
      @FileConverter() File? document});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? author = null,
    Object? created = freezed,
    Object? completion = freezed,
    Object? done = freezed,
    Object? project = freezed,
    Object? task_to_user = freezed,
    Object? doc_name = freezed,
    Object? doc = freezed,
    Object? document = freezed,
  }) {
    return _then(_$TaskImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as int,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completion: freezed == completion
          ? _value.completion
          : completion // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      done: freezed == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as int?,
      task_to_user: freezed == task_to_user
          ? _value._task_to_user
          : task_to_user // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      doc_name: freezed == doc_name
          ? _value.doc_name
          : doc_name // ignore: cast_nullable_to_non_nullable
              as String?,
      doc: freezed == doc
          ? _value.doc
          : doc // ignore: cast_nullable_to_non_nullable
              as String?,
      document: freezed == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  _$TaskImpl(
      {this.id,
      this.type,
      required this.name,
      this.description,
      required this.author,
      this.created,
      this.completion,
      this.done,
      this.project,
      final List<int>? task_to_user,
      this.doc_name,
      this.doc,
      @FileConverter() this.document})
      : _task_to_user = task_to_user;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final int? id;
  @override
  final String? type;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int author;
  @override
  final DateTime? created;
  @override
  final DateTime? completion;
  @override
  final DateTime? done;
  @override
  final int? project;
  final List<int>? _task_to_user;
  @override
  List<int>? get task_to_user {
    final value = _task_to_user;
    if (value == null) return null;
    if (_task_to_user is EqualUnmodifiableListView) return _task_to_user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? doc_name;
  @override
  final String? doc;
  @override
  @FileConverter()
  final File? document;

  @override
  String toString() {
    return 'Task(id: $id, type: $type, name: $name, description: $description, author: $author, created: $created, completion: $completion, done: $done, project: $project, task_to_user: $task_to_user, doc_name: $doc_name, doc: $doc, document: $document)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.completion, completion) ||
                other.completion == completion) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.project, project) || other.project == project) &&
            const DeepCollectionEquality()
                .equals(other._task_to_user, _task_to_user) &&
            (identical(other.doc_name, doc_name) ||
                other.doc_name == doc_name) &&
            (identical(other.doc, doc) || other.doc == doc) &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      description,
      author,
      created,
      completion,
      done,
      project,
      const DeepCollectionEquality().hash(_task_to_user),
      doc_name,
      doc,
      document);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  factory _Task(
      {final int? id,
      final String? type,
      required final String name,
      final String? description,
      required final int author,
      final DateTime? created,
      final DateTime? completion,
      final DateTime? done,
      final int? project,
      final List<int>? task_to_user,
      final String? doc_name,
      final String? doc,
      @FileConverter() final File? document}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  int? get id;
  @override
  String? get type;
  @override
  String get name;
  @override
  String? get description;
  @override
  int get author;
  @override
  DateTime? get created;
  @override
  DateTime? get completion;
  @override
  DateTime? get done;
  @override
  int? get project;
  @override
  List<int>? get task_to_user;
  @override
  String? get doc_name;
  @override
  String? get doc;
  @override
  @FileConverter()
  File? get document;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
