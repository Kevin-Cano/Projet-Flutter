// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubTaskImpl _$$SubTaskImplFromJson(Map<String, dynamic> json) =>
    _$SubTaskImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$$SubTaskImplToJson(_$SubTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };

_$TaskTagImpl _$$TaskTagImplFromJson(Map<String, dynamic> json) =>
    _$TaskTagImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      colorValue: (json['colorValue'] as num).toInt(),
    );

Map<String, dynamic> _$$TaskTagImplToJson(_$TaskTagImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'colorValue': instance.colorValue,
    };

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  priority:
      $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']) ??
      TaskPriority.medium,
  status:
      $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
      TaskStatus.todo,
  dueDate: json['dueDate'] == null
      ? null
      : DateTime.parse(json['dueDate'] as String),
  projectId: json['projectId'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  subTasks:
      (json['subTasks'] as List<dynamic>?)
          ?.map((e) => SubTask.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tagIds:
      (json['tagIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'priority': _$TaskPriorityEnumMap[instance.priority]!,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'dueDate': instance.dueDate?.toIso8601String(),
      'projectId': instance.projectId,
      'createdAt': instance.createdAt.toIso8601String(),
      'sortOrder': instance.sortOrder,
      'subTasks': instance.subTasks,
      'tagIds': instance.tagIds,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
  TaskPriority.urgent: 'urgent',
};

const _$TaskStatusEnumMap = {
  TaskStatus.todo: 'todo',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.done: 'done',
};
