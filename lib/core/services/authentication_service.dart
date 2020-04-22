import 'dart:async';

import 'package:provider_architecture_example/core/models/user.dart';
import 'package:provider_architecture_example/core/services/api.dart';
import 'package:provider_architecture_example/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    User fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser?.id != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }
    return hasUser;
  }
}
