import 'package:flutter/material.dart';

import '../data/dto/posts_response.dart';

class PostsScreen extends StatelessWidget {
  List<PostsResponse> posts;
  String imageUrl;

  PostsScreen(this.posts, this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        Expanded(flex: 1,
          child: Image.network(imageUrl,
              fit: BoxFit.cover,
              height: 150,
              width: MediaQuery.of(context).size.width),
        ),
            Expanded(flex: 3,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(child: Column(children: [Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Title : ${posts[index].title.toString()}" , style: const TextStyle(color: Colors.black , fontSize: 20)),
                ) ,

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Body : ${posts[index].body.toString()}", style: const TextStyle(color: Colors.black , fontSize: 15)),

                  )],));
              }),
        )
      ])),
    );
  }
}
