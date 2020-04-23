import 'package:flutter/material.dart';
import 'package:provider_architecture_example/core/view_models/like_button_model.dart';
import 'package:provider_architecture_example/ui/shared/ui_helpers.dart';
import 'package:provider_architecture_example/ui/views/base_view.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  const LikeButton({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonModel>(
      builder: (context, model, child) => Row(
        children: <Widget>[
          Text('Likes ${model.postLikes(postId)}'),
          UIHelper.horizontalSpaceSmall(),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => model.incrementLikes(postId),
          )
        ],
      ),
    );
  }
}
