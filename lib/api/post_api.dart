import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/models/post.dart';
import 'package:flutter_template/models/user.dart';

import 'urls.dart';
import 'base_api.dart';

/// The service responsible for networking requests
class PostApi extends BaseApi {



  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    // Get user posts for id
    var response = await get('$base_url$post_path$userId');

    // parse into List
    var parsed = json.decode(response.data) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }



}
