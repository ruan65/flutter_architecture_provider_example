import 'package:provider_architecture_example/core/enums/view_state.dart';
import 'package:provider_architecture_example/core/models/comment.dart';
import 'package:provider_architecture_example/core/services/api.dart';
import 'package:provider_architecture_example/core/view_models/base_model.dart';
import 'package:provider_architecture_example/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);

    comments = await _api.getCommentsForPost(postId);

    setState(ViewState.Idle);
  }
}
