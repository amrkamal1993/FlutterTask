import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/dio_client/dio_client.dart';
import '../dto/posts_response.dart';

class PostsDataProvider{
  final IDioClient dioClient;
  PostsDataProvider({required this.dioClient});


  Future<List<PostsResponse>> getPostsAsync() async {
    try {
      Response<dynamic> response =
      await dioClient.getClient().get("posts");
      return (response.data as List<dynamic>)
          .map((e) => PostsResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      if(kDebugMode){
        print(e);
      }
      throw Exception(e);
    }
  }
}