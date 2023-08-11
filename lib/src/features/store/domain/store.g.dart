// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      id: json['id'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String,
      img: json['img'] as String?,
      user: json['user'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      menus: (json['menus'] as List<dynamic>?)
              ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'img': instance.img,
      'user': instance.user,
      'address': instance.address,
      'phone': instance.phone,
      'menus': instance.menus,
    };
