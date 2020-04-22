import 'package:provider_architecture_example/core/models/user.dart';
import 'package:provider_architecture_example/core/services/api.dart';
import 'package:provider_architecture_example/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    User fetchedUser = await _api.getUserProfile(userId);
    return fetchedUser?.id != null;
  }
}
