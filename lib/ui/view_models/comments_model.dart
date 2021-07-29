

import 'package:flutter_template/api/comment_api.dart';
import 'package:flutter_template/models/comment.dart';
import 'package:flutter_template/ui/shared/viewstate.dart';

import '../../locator.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  CommentApi _api = locator<CommentApi>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = (await _api.getCommentsForPost(postId)).cast<Comment>();
    setState(ViewState.Idle);
  }
}
