import 'package:provider_architecture_example/core/enums/view_state.dart';
import 'package:provider_architecture_example/core/services/authentication_service.dart';
import 'package:provider_architecture_example/core/view_models/base_model.dart';
import 'package:provider_architecture_example/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    final userId = int.tryParse(userIdText);

    if (null == userId) {
      errorMessage = 'Value is not a number';
      setState(ViewState.Idle);
      return false;
    }

    final success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
