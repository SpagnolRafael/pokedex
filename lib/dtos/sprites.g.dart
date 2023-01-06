// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sprites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      frontDefaultImage: json['front_default'] as String,
      other: json['other'] == null
          ? null
          : ImagesAbout.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'front_default': instance.frontDefaultImage,
      'other': instance.other,
    };
