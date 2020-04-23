import 'package:provider_architecture_example/core/models/post.dart';
import 'package:provider_architecture_example/locator.dart';

import 'api.dart';

class PostService {
  final Api _api = locator<Api>();

  List<Post> _posts;

  List<Post> get posts => _posts;


  Future getPostsForUser(int userId) async {
    _posts = await _api.getPostsForUser(userId);

  }

  incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).likes++;
  }
}
