import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@Freezed(genericArgumentFactories: true)
class Pagination<T> with _$Pagination<T> {
  factory Pagination({
    int? count,
    String? next,
    @JsonKey(name: 'previous') String? prev,
    required List<T> results,
  }) = _Pagination;

  factory Pagination.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginationFromJson(json, fromJsonT);
}

