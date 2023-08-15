// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      img: json['img'] as String? ?? '',
      address: json['address'] as String,
      isStore: json['is_store'] as bool,
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'img': instance.img,
      'address': instance.address,
      'is_store': instance.isStore,
    };
