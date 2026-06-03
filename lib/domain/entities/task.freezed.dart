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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubTask _$SubTaskFromJson(Map<String, dynamic> json) {
  return _SubTask.fromJson(json);
}

/// @nodoc
mixin _$SubTask {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  /// Serializes this SubTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubTaskCopyWith<SubTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubTaskCopyWith<$Res> {
  factory $SubTaskCopyWith(SubTask value, $Res Function(SubTask) then) =
      _$SubTaskCopyWithImpl<$Res, SubTask>;
  @useResult
  $Res call({String id, String title, bool completed});
}

/// @nodoc
class _$SubTaskCopyWithImpl<$Res, $Val extends SubTask>
    implements $SubTaskCopyWith<$Res> {
  _$SubTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            completed: null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubTaskImplCopyWith<$Res> implements $SubTaskCopyWith<$Res> {
  factory _$$SubTaskImplCopyWith(
    _$SubTaskImpl value,
    $Res Function(_$SubTaskImpl) then,
  ) = __$$SubTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, bool completed});
}

/// @nodoc
class __$$SubTaskImplCopyWithImpl<$Res>
    extends _$SubTaskCopyWithImpl<$Res, _$SubTaskImpl>
    implements _$$SubTaskImplCopyWith<$Res> {
  __$$SubTaskImplCopyWithImpl(
    _$SubTaskImpl _value,
    $Res Function(_$SubTaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(
      _$SubTaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        completed: null == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubTaskImpl implements _SubTask {
  const _$SubTaskImpl({
    required this.id,
    required this.title,
    this.completed = false,
  });

  factory _$SubTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubTaskImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString() {
    return 'SubTask(id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, completed);

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubTaskImplCopyWith<_$SubTaskImpl> get copyWith =>
      __$$SubTaskImplCopyWithImpl<_$SubTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubTaskImplToJson(this);
  }
}

abstract class _SubTask implements SubTask {
  const factory _SubTask({
    required final String id,
    required final String title,
    final bool completed,
  }) = _$SubTaskImpl;

  factory _SubTask.fromJson(Map<String, dynamic> json) = _$SubTaskImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get completed;

  /// Create a copy of SubTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubTaskImplCopyWith<_$SubTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskTag _$TaskTagFromJson(Map<String, dynamic> json) {
  return _TaskTag.fromJson(json);
}

/// @nodoc
mixin _$TaskTag {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;

  /// Serializes this TaskTag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskTagCopyWith<TaskTag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskTagCopyWith<$Res> {
  factory $TaskTagCopyWith(TaskTag value, $Res Function(TaskTag) then) =
      _$TaskTagCopyWithImpl<$Res, TaskTag>;
  @useResult
  $Res call({String id, String label, int colorValue});
}

/// @nodoc
class _$TaskTagCopyWithImpl<$Res, $Val extends TaskTag>
    implements $TaskTagCopyWith<$Res> {
  _$TaskTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? colorValue = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            colorValue: null == colorValue
                ? _value.colorValue
                : colorValue // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskTagImplCopyWith<$Res> implements $TaskTagCopyWith<$Res> {
  factory _$$TaskTagImplCopyWith(
    _$TaskTagImpl value,
    $Res Function(_$TaskTagImpl) then,
  ) = __$$TaskTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, int colorValue});
}

/// @nodoc
class __$$TaskTagImplCopyWithImpl<$Res>
    extends _$TaskTagCopyWithImpl<$Res, _$TaskTagImpl>
    implements _$$TaskTagImplCopyWith<$Res> {
  __$$TaskTagImplCopyWithImpl(
    _$TaskTagImpl _value,
    $Res Function(_$TaskTagImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaskTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? colorValue = null,
  }) {
    return _then(
      _$TaskTagImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        colorValue: null == colorValue
            ? _value.colorValue
            : colorValue // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskTagImpl implements _TaskTag {
  const _$TaskTagImpl({
    required this.id,
    required this.label,
    required this.colorValue,
  });

  factory _$TaskTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskTagImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final int colorValue;

  @override
  String toString() {
    return 'TaskTag(id: $id, label: $label, colorValue: $colorValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, colorValue);

  /// Create a copy of TaskTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskTagImplCopyWith<_$TaskTagImpl> get copyWith =>
      __$$TaskTagImplCopyWithImpl<_$TaskTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskTagImplToJson(this);
  }
}

abstract class _TaskTag implements TaskTag {
  const factory _TaskTag({
    required final String id,
    required final String label,
    required final int colorValue,
  }) = _$TaskTagImpl;

  factory _TaskTag.fromJson(Map<String, dynamic> json) = _$TaskTagImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  int get colorValue;

  /// Create a copy of TaskTag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskTagImplCopyWith<_$TaskTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  TaskPriority get priority => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  List<SubTask> get subTasks => throw _privateConstructorUsedError;
  List<String> get tagIds => throw _privateConstructorUsedError;

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
  $Res call({
    String id,
    String title,
    String? description,
    TaskPriority priority,
    TaskStatus status,
    DateTime? dueDate,
    String? projectId,
    DateTime createdAt,
    int sortOrder,
    List<SubTask> subTasks,
    List<String> tagIds,
  });
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
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? priority = null,
    Object? status = null,
    Object? dueDate = freezed,
    Object? projectId = freezed,
    Object? createdAt = null,
    Object? sortOrder = null,
    Object? subTasks = null,
    Object? tagIds = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as TaskPriority,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatus,
            dueDate: freezed == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            projectId: freezed == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            subTasks: null == subTasks
                ? _value.subTasks
                : subTasks // ignore: cast_nullable_to_non_nullable
                      as List<SubTask>,
            tagIds: null == tagIds
                ? _value.tagIds
                : tagIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
    _$TaskImpl value,
    $Res Function(_$TaskImpl) then,
  ) = __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    TaskPriority priority,
    TaskStatus status,
    DateTime? dueDate,
    String? projectId,
    DateTime createdAt,
    int sortOrder,
    List<SubTask> subTasks,
    List<String> tagIds,
  });
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
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? priority = null,
    Object? status = null,
    Object? dueDate = freezed,
    Object? projectId = freezed,
    Object? createdAt = null,
    Object? sortOrder = null,
    Object? subTasks = null,
    Object? tagIds = null,
  }) {
    return _then(
      _$TaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as TaskPriority,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus,
        dueDate: freezed == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        projectId: freezed == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        subTasks: null == subTasks
            ? _value._subTasks
            : subTasks // ignore: cast_nullable_to_non_nullable
                  as List<SubTask>,
        tagIds: null == tagIds
            ? _value._tagIds
            : tagIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl({
    required this.id,
    required this.title,
    this.description,
    this.priority = TaskPriority.medium,
    this.status = TaskStatus.todo,
    this.dueDate,
    this.projectId,
    required this.createdAt,
    this.sortOrder = 0,
    final List<SubTask> subTasks = const [],
    final List<String> tagIds = const [],
  }) : _subTasks = subTasks,
       _tagIds = tagIds;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey()
  final TaskPriority priority;
  @override
  @JsonKey()
  final TaskStatus status;
  @override
  final DateTime? dueDate;
  @override
  final String? projectId;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final int sortOrder;
  final List<SubTask> _subTasks;
  @override
  @JsonKey()
  List<SubTask> get subTasks {
    if (_subTasks is EqualUnmodifiableListView) return _subTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subTasks);
  }

  final List<String> _tagIds;
  @override
  @JsonKey()
  List<String> get tagIds {
    if (_tagIds is EqualUnmodifiableListView) return _tagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagIds);
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, priority: $priority, status: $status, dueDate: $dueDate, projectId: $projectId, createdAt: $createdAt, sortOrder: $sortOrder, subTasks: $subTasks, tagIds: $tagIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other._subTasks, _subTasks) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    priority,
    status,
    dueDate,
    projectId,
    createdAt,
    sortOrder,
    const DeepCollectionEquality().hash(_subTasks),
    const DeepCollectionEquality().hash(_tagIds),
  );

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(this);
  }
}

abstract class _Task implements Task {
  const factory _Task({
    required final String id,
    required final String title,
    final String? description,
    final TaskPriority priority,
    final TaskStatus status,
    final DateTime? dueDate,
    final String? projectId,
    required final DateTime createdAt,
    final int sortOrder,
    final List<SubTask> subTasks,
    final List<String> tagIds,
  }) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  TaskPriority get priority;
  @override
  TaskStatus get status;
  @override
  DateTime? get dueDate;
  @override
  String? get projectId;
  @override
  DateTime get createdAt;
  @override
  int get sortOrder;
  @override
  List<SubTask> get subTasks;
  @override
  List<String> get tagIds;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
