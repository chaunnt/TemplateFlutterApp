

import 'dart:convert';

import 'base_api.dart';
import '../models/comment.dart';
import 'urls.dart';

/// The service responsible for networking requests
class CommentApi extends BaseApi {


  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    // Get comments for post
    var response = await get('$base_url$comment_path$postId');

    // Parse into List
    var parsed = json.decode(response.data) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }



}
