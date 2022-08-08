import '../data_provider/posts_data_provider.dart';
import '../dto/posts_response.dart';

class PostsRepository {
  final PostsDataProvider postsDataProvider;

  PostsRepository({
    required this.postsDataProvider
  });

  Future<List<PostsResponse>>
  getPostsAsync()  =>
      postsDataProvider.getPostsAsync();

}
