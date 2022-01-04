import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/DataBase/DbHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BaseUrl{
  static const url= "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd";
  static String headlinesFor(String keyword){
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=e1cef2bff9334c58b5504f22d2046bd0";
  }
}

 class SharedPref{
  static ReturnShared(){
    Future<SharedPreferences> pref = SharedPreferences.getInstance();
     return pref;
  }
 }
/*class DataBaseCons{
  DbHelper dbHelper;
  DataBaseCons({this.dbHelper});
}*/
final formKey = new GlobalKey<FormState>();

const String tableNews = 'news';
const String columnTitle = 'title';
const String columnDesc = 'description';
const String columnUrl = 'url';
const String columnUrlToImage = 'urlToImage';
const String columnId = 'id';
