/*
import 'dart:async';
import 'dart:io' as io;

import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Article.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Articles.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
class DBHelper2 {
  static Database _db;
  // Create the Table colums
  static const String TABLE = 'articles';
  static const String ID = 'id';
  static const String TITLE = 'title';
  static const String DESCRIPTION = 'description';
  static const String  URLTOIMAGE = 'urlToImage';
  static const String  url = 'url';
  static const String DB_NAME = 'articles.db';

  // Initialize the Database
  Future<Database> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }


  initDb() async {
    // Get the Device's Documents directory to store the Offline Database...
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    // Create the DB Table
    await db.execute(
        "CREATE TABLE $TABLE"
            " ($ID INTEGER PRIMARY KEY, "
            " $TITLE TEXT, "
            "$DESCRIPTION TEXT,"
            "$URLTOIMAGE TEXT,"
            "$url TEXT)");
  }
  Future<NewsArticle> save(NewsArticle article) async {
    var dbClient = await db;
    // this will insert the Album object to the DB after converting it to a json
    article.id = (await dbClient.insert(TABLE, article.toJson())) as String;
    return article;
  }
// Method to return all Albums from the DB
   Future<NewsModel>getArticle()async{
    var dbclient= await db;

    List<Map> maps=
        await dbclient.query(TABLE,columns: [ID,TITLE ,DESCRIPTION,URLTOIMAGE,url]);
    NewsModel news= NewsModel(articlsmodel: []);
    List<NewsArticle> articles=[];
    if(maps.length>0){
      for(int i=0;i<maps.length;i++){
        articles.add(NewsArticle.fromJson(maps[i]));
      }
    }
    news.articlsmodel=articles;
    return news;
   }
  // Method to delete an Album from the Database
  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  // Method to Update an Album in the Database
  Future<int> update(NewsArticle article) async {
    var dbClient = await db;
    return await dbClient
        .update(TABLE, article.toJson(), where: '$ID = ?', whereArgs: [article.id]);
  }

  // Method to Truncate the Table
  Future<void> truncateTable() async {
    var dbClient = await db;
    return await dbClient.delete(TABLE);
  }

  // Method to Close the Database
  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
*/
import 'package:flutter/cupertino.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static Future<Database> database()async{
    var databasesPath= await getDatabasesPath();
    String path= join(databasesPath,'favoriteNews.db');

    return openDatabase(path,version: 1,onCreate: (db,version)async{

      print("Database is created");
      return await db.execute('''
  CREATE TABLE $tableNews (
  $columnId TEXT PRIMARY KEY,
  $columnTitle TEXT,
  $columnDesc TEXT,
  $columnUrl TEXT,
  $columnUrlToImage TEXT)
''');
    });
  }
  static insertData(NewsArticle newsArticle)async{
    try{
      final db= await DatabaseHelper.database();
      db.insert('$tableNews', newsArticle.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace
      );
      print("is Inserted");
    }catch(e){
      print(e);
    }
  }
  static Future<List<Map<String, dynamic>>> getData()async{
    try{
      final db= await DatabaseHelper.database();
      var list= await db.query(tableNews);
      print(list.toString());
      return list;
    }catch(e){
      print(e);
      throw(e);
    }
  }
  static deleteOneItem(NewsArticle newsArticle)async{
    try{
      final db= await DatabaseHelper.database();
      db.delete(tableNews,where: '$columnId=?',whereArgs: [newsArticle.id]);
      print('is deleted');
    }

    catch(e){
      print(e);
    }
  }
}