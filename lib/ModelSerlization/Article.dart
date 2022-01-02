import 'package:json_annotation/json_annotation.dart';

part 'Article.g.dart';

@JsonSerializable()
class Article {
  String id;
  String title;
  String description;
  String url;
  bool fav;

  Article({this.id,  this.title,  this.description,  this.url, this.fav, Newsarticles});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}