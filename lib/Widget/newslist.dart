import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Pages/NewsArticleDetailsPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';

class ListNews extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  final Function(NewsArticleViewModel article) onSelected;
  ListNews({this.articles, this.onSelected});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            onTap: () {
              this.onSelected(article);

            },
            leading: Container(
                width: 100,
                height: 100,
                child: article.imagUrl == null
                    ? Image.asset("Images/splash_Logo.png")
                    : Image.network(article.imagUrl)),
            title: Text(articles[index].title),
          );
        });
  }
}
