

import 'package:mvvm_buildrealproject/DataBase/APIdataBase.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Article.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Articles.dart';
import 'package:mvvm_buildrealproject/Services/Webservices.dart';
import 'package:mvvm_buildrealproject/Services/storageService.dart';

class NewsServices{
  SQLService sqlService= SQLService();
  StorageService storageService= StorageService();
  List<Article> articles= [];
  Article article;
  int counter;
  List<Article> getItems() {
    counter=1;
    Articles Newsarticles=  WebServices().getArticles() as Articles;
    Newsarticles.articles.forEach((element) {
      element=counter as Article;
      articles.add(Article.fromJson(element.toJson()));
      counter++;

    });
    return articles;
  }

  List<Article> get items {
    return  getItems();
  }

  Future openDB() async{
    return await sqlService.openDB();
  }

    loadItems()async{
    // load from local database
    bool isFirst= await isFirstTime();
    if(isFirst){
      List items= await getLocalDBRecord();
      return items;
    }else{
      // save Record into DB & load record
      List items= await saveToLocalDB();
      return items;
    }
    }

    Future<bool> isFirstTime()async{
    return await storageService.getItem("isFirstTime")=='true';
    }

    Future saveToLocalDB() async{
    List<Article> articles= this.items ;
    for(var i=0;i<items.length;i++){
      await sqlService.saveRecord(items[i]);
    }
    storageService.setItem("isFirstTime", "true");
    }

    Future getLocalDBRecord() async{
    return await sqlService.getItemsRecord();
    }
    Future seItemAsFavourit(id,flage)async{
    return await sqlService.setItemFavourit(article, id, flage);
    }
    Future getFavList()async{
    return await sqlService.getFavoritList();
    }
    removeFromFavorit(int FavId)async{
    return await sqlService.removeFromCart(FavId);
    }
    Future addtoFavorit(Article article)async{
    return await sqlService.addToFavorit(article);
    }
}