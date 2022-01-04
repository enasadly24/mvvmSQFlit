import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Model/USer_Model.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/Pages/NewsArticleDetailsPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/UserViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/FavoritButton.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ListNews extends StatefulWidget {
  final List<NewsArticleViewModel> articles;

  final Function(NewsArticleViewModel article) onSelected;
  ListNews({this.articles, this.onSelected});

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  List<NewsArticle>myNews=[];

  @override
  Widget build(BuildContext context) {
    final users=Provider.of<NewUserViewMode>(context);
    return  ListView.builder(
          itemCount: widget.articles.length,
          itemBuilder: (context, index) {
            final article = widget.articles[index];
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    this.widget.onSelected(article);
                  },
                  leading: Container(
                      width: 100,
                      height: 100,
                      child: article.imagUrl == null
                          ? Image.asset("Images/splash_Logo.png")
                          : Image.network(article.imagUrl)),
                  title: Text(widget.articles[index].title),
                  //trailing: FavoritButton()

                ),
                 Container(
                   height: 8.0.h,
                   //width: double.infinity,
                   child: Stack(
                      children: [
                        FavoritButton(
                          desc: widget.articles[index].description,
                          title:widget.articles[index].title,
                          url: widget.articles[index].url,
                          urlImage: widget.articles[index].imagUrl,
                        ),
                      ],
                    ),
                 )

              ],

            );
          });

  }
}



