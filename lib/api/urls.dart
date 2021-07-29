import 'package:flutter/foundation.dart';



const base_url_develop = "https://jsonplaceholder.typicode.com";
const base_url_production = "https://google.com";

const base_url = kReleaseMode ? "https://google.com" :  "https://jsonplaceholder.typicode.com";
const comment_path = "/comments?postId=";
const post_path = "/posts?userId=";
const user_path = "/users/";