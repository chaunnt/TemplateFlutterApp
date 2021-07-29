import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_template/models/post.dart';

class DbHelper {

  static final DbHelper _dbHelper = DbHelper._internal();
  static Database _db;

  String tblPost = "post";
  String colUserId = "userId";
  String colId  = "id";
  String colTitle = "title";
  String colBody = "body";
  String colLikes = "likes";

  DbHelper._internal();

  factory DbHelper(){
    return _dbHelper;
  }

  Future<Database> get db async {
    if(_db == null){
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb () async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "flutter_template.db";
    var dbTemplate = await openDatabase(path,version: 1,onCreate: _createDb);
    return dbTemplate;
  }

  void _createDb ( Database db, int newVersion) async {
      await db.execute("CREATE TABLE $tblPost($colId INTERGER PRIMARY KEY, $colUserId INTERGER, $colBody TEXT, $colLikes INTERGER, $colTitle TEXT)");
  }

  Future<int> insertPost(Post post) async {
    Database db = await this.db;
    var result = await db.insert(tblPost, post.toJson());
    return result;
  }

  Future<List> getPosts(int userId) async {
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $tblPost WHERE $colUserId = $userId");
    return result;
  }

  Future<int> updatePost( Post post) async {
    Database db = await this.db;
    var result = await db.update(tblPost,post.toJson(),where: "$colId = ? ",whereArgs: [post.id]);
    return result;
  }
  Future<int> deletePost( int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("DELETE FROM $tblPost WHERE $colId = $id");
    return result;
  }


}