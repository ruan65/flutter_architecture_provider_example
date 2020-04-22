import 'package:flutter/material.dart';
import 'package:provider_architecture_example/locator.dart';
import 'package:provider_architecture_example/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider architecture',
      theme: ThemeData(),
      initialRoute: Router.login,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
