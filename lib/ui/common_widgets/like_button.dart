import 'package:flutter/material.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/services/authentication_service.dart';
import 'package:flutter_template/ui/view_models/home_model.dart';
import 'package:flutter_template/ui/view_models/like_button_model.dart';
import 'package:flutter_template/ui/views/base_view.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  LikeButton({
    @required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<LikeButtonModel>(
        builder: (context, model, child) => Row(
              children: <Widget>[
                Text('Likes ${model.postLikes(postId)}'),
                MaterialButton(
                  color: Colors.white,
                  child: Icon(Icons.thumb_up),
                  onPressed: () {
                    model.increaseLikes(postId);

                  },
                )
              ],
            ));
  }
}
