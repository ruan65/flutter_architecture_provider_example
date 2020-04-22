import 'package:get_it/get_it.dart';
import 'package:provider_architecture_example/core/services/api.dart';
import 'package:provider_architecture_example/core/services/authentication_service.dart';
import 'package:provider_architecture_example/core/view_models/home_model.dart';
import 'package:provider_architecture_example/core/view_models/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());

  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
}
