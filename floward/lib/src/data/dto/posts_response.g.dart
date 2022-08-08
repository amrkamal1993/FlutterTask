// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsResponse _$PostsResponseFromJson(Map<String, dynamic> json) =>
    PostsResponse(
      json['userId'] as int?,
      json['id'] as int?,
      json['title'] as String?,
      json['body'] as String?,
    );

Map<String, dynamic> _$PostsResponseToJson(PostsResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
