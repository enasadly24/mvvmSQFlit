import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Pages/FavoritPage.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/newslist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritDetails extends StatefulWidget {
/*  FavoritPage fb;
  FavoritDetails({this.fb});*/
  ListNews article;
  FavoritDetails({this.article});

  @override
  State<FavoritDetails> createState() => _FavoritDetailsState(article: article);
}

class _FavoritDetailsState extends State<FavoritDetails> {
  ListNews article;
  _FavoritDetailsState({this.article});
  SharedPreferences StoredData;
  String data;
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  Future<String> initial() async {
    StoredData = await SharedPref.ReturnShared();
    setState(() {
      data = StoredData.getString('data');
      return data;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final vm=API_Database.db.getAllArticles();
    return ListTile(
      title: Text('${data}'),
    );
  }
}
