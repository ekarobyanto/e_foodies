// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pagination<T> _$$_PaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_Pagination<T>(
      count: json['count'] as int?,
      next: json['next'] as String?,
      prev: json['previous'] as String?,
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$_PaginationToJson<T>(
  _$_Pagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.prev,
      'results': instance.results.map(toJsonT).toList(),
    };
