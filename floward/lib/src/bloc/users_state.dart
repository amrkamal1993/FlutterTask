
part of 'users_cubit.dart';


abstract class UsersState {}

class UsersInitial extends UsersState {}
class UsersLoading extends UsersState {}
class UsersSuccess extends UsersState {
  final List<UsersResponse> response;
  UsersSuccess(this.response);
}
class UsersFailed extends UsersState {
  final String errorMessage;
  UsersFailed(this.errorMessage);
}
class UsersEmpty extends UsersState {}