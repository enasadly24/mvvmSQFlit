class NewsArticle{
  String id;
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({this.id,this.title,this.description,this.urlToImage,this.url});
  // creat new instance of newsarticle class
  factory NewsArticle.fromJson(Map<String, dynamic> json){
    return NewsArticle(
      id: json['id'],
      title: json["title"],
      description: json["description"],
      urlToImage: json["urlToImage"],
      url: json["url"]
    );

  }
  Map<String,dynamic> toJson()=>{
    'id':id,
    'title':title,
    'description':description,
  };

}