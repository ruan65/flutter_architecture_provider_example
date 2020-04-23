import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture_example/core/services/authentication_service.dart';
import 'package:provider_architecture_example/locator.dart';
import 'package:provider_architecture_example/ui/router.dart';

import 'core/models/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Provider architecture',
        theme: ThemeData(),
        initialRoute: Router.home,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
