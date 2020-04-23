import 'package:get_it/get_it.dart';
import 'package:provider_architecture_example/core/services/api.dart';
import 'package:provider_architecture_example/core/services/authentication_service.dart';
import 'package:provider_architecture_example/core/services/posts_service.dart';
import 'package:provider_architecture_example/core/view_models/comments_model.dart';
import 'package:provider_architecture_example/core/view_models/home_model.dart';
import 'package:provider_architecture_example/core/view_models/like_button_model.dart';
import 'package:provider_architecture_example/core/view_models/login_model.dart';
import 'package:provider_architecture_example/ui/widgets/like_button.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
  locator.registerFactory(() => LikeButtonModel());

  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => Api());
}
