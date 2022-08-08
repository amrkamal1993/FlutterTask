import 'package:floward/core/router/route_names.dart';
import 'package:floward/src/data/dto/posts_response.dart';
import 'package:floward/src/view/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../src/view/users_screen.dart';


class RouteGenerator {
  static PageTransitionType pageTransitionType = PageTransitionType.rightToLeft;
  static Alignment pageAlignment = Alignment.bottomCenter;
  static Duration pushDuration = const Duration(milliseconds: 300);
  static Duration popDuration = const Duration(milliseconds: 300);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.index:
        return PageTransition(
            child:  const UserScreen(),
            type: pageTransitionType,
            alignment: pageAlignment,
            reverseDuration: popDuration,
            duration: pushDuration);
      case RouteNames.postsScreen:
        List<PostsResponse> dynamicArgs = (args as List<PostsResponse>);
        String imageUrl = "";
        return PageTransition(
            child: PostsScreen(dynamicArgs,imageUrl),
            type: pageTransitionType,
            alignment: pageAlignment,
            reverseDuration: popDuration,
            duration: pushDuration);
      default:
        return PageTransition(
            child: const UserScreen(),
            type: pageTransitionType,
            alignment: pageAlignment,
            reverseDuration: popDuration,
            duration: pushDuration);
    }

  }
}