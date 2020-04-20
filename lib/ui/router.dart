import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture_example/ui/views/home_view.dart';
import 'package:provider_architecture_example/ui/views/login_view.dart';
import 'package:provider_architecture_example/ui/views/post_view.dart';

class Router {
  static const home = '/';
  static const login = '/login';
  static const post = '/post';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case post:
        return MaterialPageRoute(builder: (_) => PostView());
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
