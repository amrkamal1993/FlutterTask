import 'package:json_annotation/json_annotation.dart';

part 'posts_response.g.dart';

@JsonSerializable()
class PostsResponse {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsResponse(
      this.userId,
      this.id,
      this.title,
      this.body,);
  factory PostsResponse.fromJson(Map<String, dynamic> json) =>
      _$PostsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostsResponseToJson(this);
}