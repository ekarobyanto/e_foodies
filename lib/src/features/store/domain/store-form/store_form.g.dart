// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreForm _$$_StoreFormFromJson(Map<String, dynamic> json) => _$_StoreForm(
      name: json['name'] as String,
      desc: json['desc'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      openTime: json['openTime'] as String,
      closeTime: json['closeTime'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$$_StoreFormToJson(_$_StoreForm instance) =>
    <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'address': instance.address,
      'phone': instance.phone,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'imagePath': instance.imagePath,
    };
