import 'package:floward/src/data/dto/users_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/users_repository.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepository _userRepo;

  UsersCubit(this._userRepo) : super(UsersInitial());

  Future<void> loadUsersAsync() async {
    emit(UsersLoading());
    final response = await _userRepo.getUsersAsync();
    if (response.isNotEmpty) {
      emit(UsersSuccess(response));
    } else {
      emit(UsersEmpty());
    }
  }


}
