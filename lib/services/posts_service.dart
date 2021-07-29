

import 'package:flutter/cupertino.dart';
import 'package:flutter_template/api/post_api.dart';
import 'package:flutter_template/models/post.dart';
import 'package:flutter_template/util/dbhelper.dart';

import '../locator.dart';

class PostsService {
  PostApi _api = locator<PostApi>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async {
    DbHelper helper = DbHelper();

   await  helper.initializeDb();
   var result = await  helper.getPosts(userId);
    if(result != null && result.length > 0){
       _posts = List<Post>();
      for(var i = 0; i < result.length; i++){
        debugPrint('---postlocal----'   + result[i]['title']);
        _posts.add(Post.fromJson(result[i]));
      }

    }else{
      _posts = await _api.getPostsForUser(userId);

      if(_posts.length > 0){
        for(final post in _posts){
           helper.insertPost(post);
        }
      }
    }


  }

  void incrementLikes(int postId){
    _posts.firstWhere((post) => post.id == postId).likes++;
  }
} 
