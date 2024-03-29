import 'package:flutter/material.dart';
import 'package:flutter_template/models/post.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/ui/common_widgets/comments.dart';
import 'package:flutter_template/ui/common_widgets/like_button.dart';
import 'package:flutter_template/ui/shared/app_colors.dart';
import 'package:flutter_template/ui/shared/text_styles.dart';
import 'package:flutter_template/ui/shared/ui_helpers.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Post'),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            LikeButton(postId: post.id, ),
            Comments(post.id),
          ],
        ),
      ),
    );
  }
}
