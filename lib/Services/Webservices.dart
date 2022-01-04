
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';

import 'package:mvvm_buildrealproject/Services/Constants.dart';
// resp making network request

// http get actual data


class WebServices{

  List<NewsArticle> myNews=[];
  Future<List<NewsArticle>> fetchTopHeadLines() async {
    final response = await http.get(Uri.parse(BaseUrl.url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      var length= result["articles"].length;
      for(int i=0;i<length;i++){
        if(result["articles"][i]["description"]!=null&&
            result["articles"][i]["urlToImage"]!=null){
          NewsArticle singleItem= NewsArticle(
            description: result["articles"][i]["description"],
            urlToImage: result["articles"][i]["urlToImage"],
            url: result["articles"][i]["url"],
            title: result["articles"][i]["title"]
          );
          myNews.add(singleItem);
        }
      }
      return list.map((article) => NewsArticle.fromJson(article)).toList();
      // convert to viewmodel to viewed on screen


    }else{
      throw Exception("Failed to get top news");
  }
}
}
