// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) =>
    UsersResponse(
      json['albumId'] as int?,
      json['userId'] as int?,
      json['name'] as String?,
      json['url'] as String?,
      json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'userId': instance.userId,
      'name': instance.name,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
