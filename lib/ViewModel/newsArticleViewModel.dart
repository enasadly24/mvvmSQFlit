// represent each row in reprsenting screen

import 'package:mvvm_buildrealproject/Model/newsArticle.dart';

class NewsArticleViewModel{
  NewsArticle newsArticle;

  NewsArticleViewModel({this.newsArticle});

  String get title{
    return newsArticle.title;
  }

  String get description{
    return newsArticle.description;
  }

  String get imagUrl{
    return newsArticle.urlToImage;
  }

  String get url{
    return newsArticle.url;
  }


}