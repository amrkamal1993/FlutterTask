import '../data_provider/users_data_provider.dart';
import '../dto/users_response.dart';

class UsersRepository {
  final UsersDataProvider usersDataProvider;

  UsersRepository({
    required this.usersDataProvider
  });

  Future<List<UsersResponse>>
  getUsersAsync()  =>
      usersDataProvider.getUsersAsync();

}
