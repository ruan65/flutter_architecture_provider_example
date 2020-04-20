import 'package:flutter/cupertino.dart';
import 'package:provider_architecture_example/core/services/authentication_service.dart';
import 'package:provider_architecture_example/locator.dart';

enum ViewState { Idle, Busy }

class LoginViewModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    final userId = int.tryParse(userIdText);

    if (null == userId) {
      return false;
    }

    final success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
