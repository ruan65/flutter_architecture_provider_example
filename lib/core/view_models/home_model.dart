import 'package:provider_architecture_example/core/enums/view_state.dart';
import 'package:provider_architecture_example/core/models/post.dart';
import 'package:provider_architecture_example/core/services/api.dart';
import 'package:provider_architecture_example/core/view_models/base_model.dart';
import 'package:provider_architecture_example/locator.dart';

class HomeModel extends BaseModel {
  final Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
