
part of 'posts_cubit.dart';


abstract class PostsState {}

class PostsInitial extends PostsState {}
class PostsLoading extends PostsState {}
class PostsSuccess extends PostsState {
  final List<PostsResponse> response;
  PostsSuccess(this.response);
}
class PostsFailed extends PostsState {
  final String errorMessage;
  PostsFailed(this.errorMessage);
}
class PostsEmpty extends PostsState {}