import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture_example/core/models/post.dart';
import 'package:provider_architecture_example/ui/views/login_view.dart';
import 'package:provider_architecture_example/ui/views/post_view.dart';
import 'package:provider_architecture_example/ui/views/tab_container.dart';

class Router {
  static const home = '/';
  static const login = '/login';
  static const post = '/post';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => TabContainer());
      case login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case post:
        final post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('no route define for ${settings.name}'),
                  ),
                ));
    }
  }
}
