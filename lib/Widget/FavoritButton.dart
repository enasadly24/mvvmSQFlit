import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Article.dart';
import 'package:mvvm_buildrealproject/Pages/FavoritPage.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:mvvm_buildrealproject/ViewModel/UserViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/newslist.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FavoritButton extends StatefulWidget {
NewsArticleViewModel article;
ListNews save;
FavoritButton({this.article,this.save});

  @override
  State<FavoritButton> createState() => _FavoritButtonState(article: article);
}

class _FavoritButtonState extends State<FavoritButton> {
  final Article item;
  SharedPreferences prefs;
  NewsArticleViewModel article;
  ListNews save;
  _FavoritButtonState({this.save,this.article,this.item});
  void initState(){
    prefinit();
    super.initState();
  }
  Future<String> prefinit()async{
    prefs = await SharedPref.ReturnShared();
    return prefs.getString('data')??" ";
  }
  @override
  Widget build(BuildContext context) {
    final users=Provider.of<NewUserViewMode>(context);
    return FavoriteButton(
        isFavorite: users.isFavourit,
        valueChanged: (_isFavorite){
          _isFavorite= widget.article.title;
          prefs.setString('data',widget.article.title);
          Navigator.push(context,MaterialPageRoute(builder: (context)=>FavoritPage()));
        },
      );
  }
}
