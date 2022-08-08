import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/dto/posts_response.dart';
import '../data/repository/posts_repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepository _postsRepo;

  PostsCubit(this._postsRepo) : super(PostsInitial());

  Future<void> loadPostsAsync() async {
    emit(PostsLoading());
    final response = await _postsRepo.getPostsAsync();
    if (response.isNotEmpty) {
      emit(PostsSuccess(response));
    } else {
      emit(PostsEmpty());
    }
  }

}
