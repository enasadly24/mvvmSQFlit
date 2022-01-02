
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Article.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Articles.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
// resp making network request

// http get actual data


class WebServices{
  Future<List<NewsArticle>> fetchTopHeadLines() async{
    final response= await http.get(Uri.parse(BaseUrl.url));
    if( response.statusCode==200){
     final result= jsonDecode(response.body);
     Iterable list=result["articles"];
     return list.map((article) =>NewsArticle.fromJson(article)).toList();
     // convert to viewmodel to viewed on screen
    }else{
      throw Exception("Failed to get top news");
    }
  }

  static List<Article> articles;

   Future<Articles>getArticles()async{
    try{
      final response= await http.get(Uri.parse(BaseUrl.url));
      if(200== response.statusCode){
        Articles articles= parseArticle(response.body);
        return articles;
      }
      else{
        Articles articles= new Articles();
        articles.articles=[];
        return articles; // we are returning empty list
      }

    }catch(e){
      Articles articles= new Articles();
      articles.articles=[];
      return articles;
    }
  }
  static Articles parseArticle(String responseBody){
    final parsed= json.decode(responseBody).cast<Map<String,dynamic>>();
    List<Article> articls= parsed.map<Article>((json)=>Article.fromJson(json)).toList();
    Articles a= new Articles();
    a.articles=articles;
    return a;
  }
}