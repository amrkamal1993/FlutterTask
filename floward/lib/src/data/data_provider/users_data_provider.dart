import 'package:dio/dio.dart';
import 'package:floward/src/data/dto/users_response.dart';
import 'package:flutter/foundation.dart';

import '../../../core/dio_client/dio_client.dart';


class UsersDataProvider{
  final IDioClient dioClient;
  UsersDataProvider({required this.dioClient});


  Future<List<UsersResponse>> getUsersAsync() async {
    try {

      Response<dynamic> response =
      await dioClient.getClient().get("users");

      return (response.data as List<dynamic>)
          .map((e) => UsersResponse.fromJson(e as Map<String, dynamic>))
          .toList();

    } catch (e) {
      if(kDebugMode){
        print(e);
      }
      throw Exception(e);
    }
  }
}