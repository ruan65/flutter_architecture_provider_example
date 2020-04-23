import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture_example/core/view_models/base_model.dart';
import 'package:provider_architecture_example/locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  const BaseView({@required this.builder, this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    super.initState();
    if (null != widget.onModelReady) {
      widget.onModelReady(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
  @override
  void dispose() {
    model.dispose();
    super.dispose();

  }
}
