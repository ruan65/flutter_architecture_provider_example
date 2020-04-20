import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture_example/core/view_models/login_vm.dart';
import 'package:provider_architecture_example/locator.dart';
import 'package:provider_architecture_example/ui/shared/app_colors.dart';
import 'package:provider_architecture_example/ui/shared/ui_helpers.dart';
import 'package:provider_architecture_example/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => locator<LoginViewModel>(),
      child: Consumer<LoginViewModel>(builder: (context, model, child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: <Widget>[
              UIHelper.verticalSpaceLarge(),
              LoginHeader(
                controller: controller,
              ),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        final success = await model.login(controller.text);
                        if (success) {
                          // navigate to the home view
                        }
                      },
                    )
            ],
          ),
        );
      }),
    );
  }
}
