import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:json_store/json_store.dart';
class NewsArticle {
   String id;
   String title;
   String description;
   String urlToImage;
   String url;


  NewsArticle(
      {this.id, this.title, this.description, this.urlToImage, this.url});

  // creat new instance of newsarticle class
  factory NewsArticle.fromJson(Map<String, dynamic> map){
    return NewsArticle(
      id: map[columnId],
      title: map[columnTitle ],
      description: map[columnDesc],
      urlToImage: map[columnUrlToImage],
      url: map[columnUrl],
    );
  }

  toJson() =>
      {
        columnId: id,
        columnTitle: title,
        columnDesc: description,
        columnUrlToImage:urlToImage,
        columnUrl:url
      };

}
class NewsModel{
  List<NewsArticle> articlsmodel;
NewsModel({this.articlsmodel});

   NewsModel.fromjson(Map<String,dynamic>json){
     this.articlsmodel=(json["articles"]as List).map((e) => NewsArticle.fromJson(e)).toList();
   }
}