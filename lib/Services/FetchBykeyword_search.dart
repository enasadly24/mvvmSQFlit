import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';

class Search{
  Future<List<NewsArticle>> fetchHeadLinesByKeyword(String keyword) async{
    final response= await http.get(Uri.parse(BaseUrl.headlinesFor(keyword)));
    if(response.statusCode==200){
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) =>NewsArticle.fromJson(json)).toList();
    } else{
      throw Exception("Failed to get news");
    }
  }
}