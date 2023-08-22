// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Menu _$$_MenuFromJson(Map<String, dynamic> json) => _$_Menu(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      user: json['user'] as String? ?? '',
      store: json['store'] as String? ?? '',
      storeAddress: json['store_address'] as String? ?? '',
      storeId: json['id_store'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      img: json['img'] as String? ?? '',
      price: json['price'] as int?,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MenuToJson(_$_Menu instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user': instance.user,
      'store': instance.store,
      'store_address': instance.storeAddress,
      'id_store': instance.storeId,
      'desc': instance.desc,
      'img': instance.img,
      'price': instance.price,
      'ingredients': instance.ingredients,
    };
