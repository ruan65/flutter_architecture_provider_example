import 'package:provider_architecture_example/core/enums/view_state.dart';
import 'package:provider_architecture_example/core/models/post.dart';
import 'package:provider_architecture_example/core/services/posts_service.dart';
import 'package:provider_architecture_example/core/view_models/base_model.dart';
import 'package:provider_architecture_example/locator.dart';

class HomeModel extends BaseModel {
  final PostService _postService = locator<PostService>();

  List<Post> get posts => _postService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
