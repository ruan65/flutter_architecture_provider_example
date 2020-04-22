import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture_example/core/enums/view_state.dart';
import 'package:provider_architecture_example/core/models/post.dart';
import 'package:provider_architecture_example/core/models/user.dart';
import 'package:provider_architecture_example/core/view_models/home_model.dart';
import 'package:provider_architecture_example/ui/shared/app_colors.dart';
import 'package:provider_architecture_example/ui/shared/text_styles.dart';
import 'package:provider_architecture_example/ui/shared/ui_helpers.dart';
import 'package:provider_architecture_example/ui/views/base_view.dart';
import 'package:provider_architecture_example/ui/widgets/postlist_item.dart';

import '../router.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getPosts(Provider.of<User>(context).id);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Welcome ${Provider.of<User>(context).name}',
                      style: subHeaderStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Text('Here are all your posts', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(
                    child: _getPostsUi(model.posts),
                  )
                ],
              ),
      ),
    );
  }

  _getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.of(context)
                .pushNamed(Router.post, arguments: posts[index]);
          },
        ),
      );
}
