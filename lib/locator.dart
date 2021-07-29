import 'package:flutter_template/api/post_api.dart';
import 'package:flutter_template/api/user_api.dart';
import 'package:flutter_template/models/comment.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/services/location_service.dart';
import 'package:flutter_template/services/posts_service.dart';
import 'package:flutter_template/ui/view_models/comments_model.dart';
import 'package:flutter_template/ui/view_models/home_model.dart';
import 'package:flutter_template/ui/view_models/like_button_model.dart';
import 'package:flutter_template/ui/view_models/login_model.dart';
import 'package:flutter_template/ui/view_models/setting_model.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_template/services/authentication_service.dart';

import 'api/comment_api.dart';
import 'api/location_api.dart';



GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PostsService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => UserApi());
  locator.registerLazySingleton(() => PostApi());
  locator.registerLazySingleton(() => CommentApi());
  locator.registerLazySingleton(() => LocationApi());
//
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => LikeButtonModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
  locator.registerFactory(() => SettingModel());

}
