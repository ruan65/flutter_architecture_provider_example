import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture_example/core/view_models/base_model.dart';
import 'package:provider_architecture_example/locator.dart';

class BaseView<T extends BaseModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;

  const BaseView({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<T>(),
      child: Consumer<T>(builder: builder),
    );
  }
}
