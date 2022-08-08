import 'package:json_annotation/json_annotation.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  int? albumId;
  int? userId;
  String? name;
  String? url;
  String? thumbnailUrl;

  UsersResponse(
      this.albumId,
      this.userId,
      this.name,
      this.url,
      this.thumbnailUrl);
  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}
