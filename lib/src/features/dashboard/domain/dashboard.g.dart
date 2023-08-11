// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Dashboard _$$_DashboardFromJson(Map<String, dynamic> json) => _$_Dashboard(
      username: json['username'] as String? ?? '',
      img: json['img'] as String? ?? '',
      nameStore: json['name_store'] as String? ?? '',
      statusStore: json['status_store'] as String? ?? 'never_requested',
      idStore: json['desc_store'] as String? ?? '',
      imageStore: json['img_store'] as String? ?? '',
      addressStore: json['address_store'] as String? ?? '',
      menu: (json['menu'] as List<dynamic>?)
              ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      store: (json['store'] as List<dynamic>?)
              ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DashboardToJson(_$_Dashboard instance) =>
    <String, dynamic>{
      'username': instance.username,
      'img': instance.img,
      'name_store': instance.nameStore,
      'status_store': instance.statusStore,
      'desc_store': instance.idStore,
      'img_store': instance.imageStore,
      'address_store': instance.addressStore,
      'menu': instance.menu,
      'store': instance.store,
    };
