import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_buildrealproject/DataBase/APIdb.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/states/states.dart';

class myProvider extends ChangeNotifier{
  List<NewsArticle> myList=[];
  var myIcon = Icons.favorite_border_outlined;
  var iconColor = Colors.grey;


  addToMyList(NewsArticle singleItem)async{
    myList.add(singleItem);
    await DatabaseHelper.insertData(singleItem);
    notifyListeners();
  }

  removeFromMyList(NewsArticle singleItem){
    for(int i=0;i<myList.length;i++){
      if(myList[i].title==singleItem.title){
        myList.remove(myList[i]);
      }
    }
    DatabaseHelper.deleteOneItem(singleItem);
    notifyListeners();

  }
  fetchDataFromSQL()async{
    var listOfNews= await DatabaseHelper.getData();
    var list= listOfNews.map((e) => NewsArticle.fromJson(e)).toList();
    myList=list;
    notifyListeners();

  }
}