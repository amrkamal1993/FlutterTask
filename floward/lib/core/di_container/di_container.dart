import 'package:floward/src/data/data_provider/posts_data_provider.dart';
import 'package:get_it/get_it.dart';

import '../../src/data/data_provider/users_data_provider.dart';
import '../../src/data/repository/posts_repository.dart';
import '../../src/data/repository/users_repository.dart';
import '../dio_client/dio_client.dart';

class DIContainer {
  final GetIt instance;

  DIContainer(this.instance) {


    instance.registerFactory<AnonymousDioClient>(() => AnonymousDioClient());

    instance.registerFactory<UsersRepository>(() => UsersRepository(
        usersDataProvider: UsersDataProvider(dioClient: instance.get<AnonymousDioClient>())));

    instance.registerFactory<PostsRepository>(() => PostsRepository(
        postsDataProvider: PostsDataProvider(dioClient: instance.get<AnonymousDioClient>())));

  }

  Future<void> allReadyAsync() => instance.allReady();
}
