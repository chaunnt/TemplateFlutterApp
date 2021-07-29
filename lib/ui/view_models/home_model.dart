

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/models/post.dart';
import 'package:flutter_template/services/posts_service.dart';
import 'package:flutter_template/ui/shared/viewstate.dart';

import '../../locator.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = locator<PostsService>();
  
  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
//    await Future.delayed(Duration(seconds: 10));

    debugPrint('userId---: '+  userId.toString() );
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}