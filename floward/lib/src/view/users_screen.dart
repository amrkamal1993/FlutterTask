import 'package:floward/src/data/repository/posts_repository.dart';
import 'package:floward/src/view/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/users_cubit.dart';
import '../data/dto/posts_response.dart';
import '../data/repository/users_repository.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> {
  late List<PostsResponse> postsList;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                UsersCubit(GetIt.instance.get<UsersRepository>())
                  ..loadUsersAsync()),
        // BlocProvider(
        //     create: (context) =>
        //     PostsCubit(GetIt.instance.get<PostsRepository>())
        //       ..loadPostsAsync())
      ],
      child: SafeArea(
          child: Scaffold(
        body: BlocConsumer<UsersCubit, UsersState>(builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(child: Text('Loading ...'));
          } else if (state is UsersSuccess) {
            return SizedBox(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: state.response.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostsScreen(
                              postsList
                                  .where((c) =>
                                      c.userId == state.response[index].userId)
                                  .toList(),
                              state.response[index].thumbnailUrl.toString()),
                        ),
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(radius: 30,backgroundImage: NetworkImage(state.response[index].thumbnailUrl!),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          child: Text('${state.response[index].name}'),
                                        ),
                                        SizedBox(
                                          height: 30,
                                          child: Text(
                                            'Posts Count = ${postsList.where((c) => c.userId == state.response[index].userId).toList().length.toString()}',
                                            style: const TextStyle(color: Colors.deepOrange),
                                          ),
                                        )
                                        
                                      ],
                                    ),
                                    const Icon(Icons.arrow_forward_rounded)
                                  ],
                                ),
                              ),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const SizedBox();
          }
        }, listener: (context, state) async {
          if (state is UsersFailed) {
            final snackBar = SnackBar(
              content: Text(state.errorMessage),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }),
      )),
    );
  }

  @override
  void initState() {
    getPostsData();
    super.initState();
  }

  void getPostsData() async {
    postsList = await GetIt.instance
        .get<PostsRepository>()
        .postsDataProvider
        .getPostsAsync();
  }
}
