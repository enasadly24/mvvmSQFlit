/*
import 'dart:convert';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/DataBase/APIdb.dart';
ime:mvvm_buildrealproject/DataBase/Comm/ValidationRejx.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Article.dart';
import 'package:mvvm_buildrealproject/Pages/FavoritPage.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:mvvm_buildrealproject/Services/Webservices.dart';
import 'package:mvvm_buildrealproject/Services/storageService.dart';
import 'package:mvvm_buildrealproject/ViewModel/UserViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/newslist.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FavoritButton extends StatefulWidget {
NewsArticleViewModel article;
ListNews save;
NewsArticle thisAticle;
FavoritButton({this.article,this.save,this.thisAticle});

  @override
  State<FavoritButton> createState() => _FavoritButtonState(article: article);
}

class _FavoritButtonState extends State<FavoritButton> {
  final _formKey = new GlobalKey<FormState>();

  SharedPrefc sharedPrefs= SharedPrefc();
  SharedPreferences prefs;
  DBHelper2 debhelp;
  NewsModel news;
  NewsArticleViewModel article;
  ListNews save;
  _FavoritButtonState({this.save,this.article});
  void initState(){
    prefinit();
    super.initState();
    debhelp=DBHelper2();
  }
  */
/*signUp()async{
    String uid = conUserId.text;
    String uname = conUserName.text;
    String email = conEmail.text;
    String passwd = conPassword.text;
    String cpasswd = conCPassword.text;
    if(formKey.currentState.validate()){
      if(passwd!=cpasswd){
        alertDialog(context, "Password Mismatch");
      }else{
        formKey.currentState.save();
        UserModel userModel= UserModel(uid, uname,email, passwd);
        await db.saveData(userModel).then((userData){
          alertDialog(context, "Successfully Saved");
          Navigator.push(context,
              MaterialPageRoute(builder:(_)=>Login()));
        }).catchError((error){
          print(error);
          alertDialog(context, "Error:Data Save Fail");
        })
        ;
      }
    }
  }*//*


  Future<String> prefinit()async{
    prefs = await SharedPref.ReturnShared();
    return prefs.getString('data')??" ";
  }
  getArticles(){
    String title= widget.thisAticle.title;
    WebServices().fetchTopHeadLines().then((ALLArticle) async {
      _formKey.currentState.save();
      NewsArticle newsArticle= NewsArticle(title: title);
      await debhelp.save(newsArticle).then((val) {
        storedata(val);
        // Write a recursive function to insert all the albums
        alertDialog(context, "Successfully Saved");
      });
    }).catchError((error){
      print(error);
      alertDialog(context, "Error:Data Save Fail");
    });
  }

  Future storedata(NewsArticle val) async {
    SharedPreferences sp= await SharedPref.ReturnShared();
    sp.setString("title", val.title);
  }


  @override
  Widget build(BuildContext context) {
    final users=Provider.of<NewUserViewMode>(context);
    return Form(
      key: _formKey,
      child: InkWell(
        onTap: getArticles,
        child: FavoriteButton(
            isFavorite: users.isFavourit,
            valueChanged: (_isFavorite){
              _isFavorite= widget.thisAticle.title;
              prefs.getString('title');
              Navigator.push(context,MaterialPageRoute(builder: (context)=>FavoritPage()));
            },
          ),
      ),
    );
  }
}
*/
import 'dart:convert';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_buildrealproject/DataBase/APIdb.dart';
import 'package:mvvm_buildrealproject/DataBase/Comm/ValidationRejx.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/Pages/FavoritPage.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:mvvm_buildrealproject/Services/Webservices.dart';
import 'package:mvvm_buildrealproject/Services/storageService.dart';
import 'package:mvvm_buildrealproject/ViewModel/UserViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/newslist.dart';
import 'package:mvvm_buildrealproject/states/cubit.dart';
import 'package:mvvm_buildrealproject/states/states.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
class FavoritButton extends StatefulWidget {
   final String url;
   final  String urlImage;
   final  String title;
   final  String desc;
  const FavoritButton({
    this.url,
    this.urlImage,
    this.title,
    this.desc});
  @override
  State<FavoritButton> createState() => _FavoritButtonState();
}

class _FavoritButtonState extends State<FavoritButton> {
  var myIcon = Icons.favorite_border_outlined;
  var iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    final users=Provider.of<NewUserViewMode>(context);
    return Positioned(
      child: BlocConsumer<FavoriteCubit,FavouriteStates>(
        listener: (context,state){},
        builder: (context,state){
          FavoriteCubit cubit= FavoriteCubit.get(context);
          return GestureDetector(
            onTap: ()async{
              NewsArticle singleItem= NewsArticle();
              singleItem.title= widget.title;
              singleItem.url= widget.url;
              singleItem.urlToImage=widget.urlImage;
              if(myIcon== Icons.favorite_border_outlined){
                setState(() {
                  myIcon= Icons.favorite;
                  iconColor=Colors.red;
                });
                cubit.addToMyList(singleItem);
              }else{
                setState(() {
                  myIcon=Icons.favorite_border_outlined;
                  iconColor=Colors.grey;
                });
                cubit.removeFromMyList(singleItem);
              }

            },
            child: Icon(
              myIcon,
              color: iconColor,
              size: 15.0.sp,
            ),
          );
        },

      ),
      top: 1.5.h,
      right: 2.0.w,

    );
  }
}

