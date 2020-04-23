import 'package:provider_architecture_example/core/services/posts_service.dart';
import 'package:provider_architecture_example/core/view_models/base_model.dart';
import 'package:provider_architecture_example/locator.dart';

class LikeButtonModel extends BaseModel {
  final _postService = locator<PostService>();

  int postLikes(int postId) =>
      _postService.posts.firstWhere((p) => p.id == postId).likes;

  incrementLikes(int postId) {
    _postService.posts.firstWhere((p) => p.id == postId).likes++;
    notifyListeners();
  }
}
