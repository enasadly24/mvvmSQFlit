import 'package:json_annotation/json_annotation.dart';
import 'Article.dart';
part 'Articles.g.dart';

@JsonSerializable()
class Articles {

 List<Article> articles;
  Articles({this.articles});

  factory Articles.fromJson(Map<String, dynamic> json) => _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

