// represent the reprsenting complete screen
// parent view model

import 'package:flutter/cupertino.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/Services/FetchBykeyword_search.dart';
import 'package:mvvm_buildrealproject/Services/Webservices.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';

   enum LoadingStatus{
     completed,
     searching,
     empty
   }

class NewsArticleListViewModel extends ChangeNotifier{
     var loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles= List<NewsArticleViewModel>();
 //response populate top head line
// need access to webservic
Future<void>search(String Keyword)async{
     this.loadingStatus= LoadingStatus.searching;
     notifyListeners();
     List<NewsArticle>newsArticles= await Search().fetchHeadLinesByKeyword(Keyword);
     // converto to viewmodel
  this.articles= newsArticles.map((article) => NewsArticleViewModel(newsArticle: article)).toList();
  this.loadingStatus = this.articles.isEmpty? LoadingStatus.empty:LoadingStatus.completed;
  notifyListeners(); //page will be refreshed again
}

Future<void> populateTopHeadlines() async{ // calling web service so it async

  this.loadingStatus=LoadingStatus.searching;
  notifyListeners();

  List<NewsArticle>newsArticles= await WebServices().fetchTopHeadLines();

  // to acces viewmodel to interact with view

 this.articles= newsArticles.map((article) =>NewsArticleViewModel(newsArticle:article)).toList();
 this.loadingStatus= this.articles.isEmpty? LoadingStatus.empty:LoadingStatus.completed;
 notifyListeners();
}
}