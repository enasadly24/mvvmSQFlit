
import 'package:get/get.dart';
import 'package:mvvm_buildrealproject/ModelSerlization/Article.dart';
import 'package:mvvm_buildrealproject/Services/NewsListService.dart';

class HomePageController extends GetxController{
  NewsServices itemServices= NewsServices();
  List<Article> items=[];
  List<Article> favoritItems=[];
  bool isloading=true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadDB();
  }
  loadDB()async{
    await itemServices.openDB();
    loadItems();
    getFavoritList();
  }
  getItem(int id){
    return items.singleWhere((element) => element.id==id);
  }
  bool isAreadyInFav(id){
    return favoritItems.indexWhere((element) => element.id==id)>-1;
  }
  getFavoritList()async{
    try{
      List list= await itemServices.getFavList();
      favoritItems.clear();
      list.forEach((element) {
        favoritItems.add(Article.fromJson(element));
      });
      update();
    }catch(e){
      print(e);
    }
  }
  loadItems()async{
    try{
      isloading=true;
      update();
      List list= await itemServices.loadItems();
      list.forEach((element) {
        items.add(Article.fromJson(element));
      });
      isloading=false;
      update();
    }catch(e){
      print(e);
    }
  }
  setToFav(int id, bool flag)async{
    int index= items.indexWhere((element) => element.id==id);
    items[index].fav=flag;
    update();
    try{
      await itemServices.seItemAsFavourit(id, flag);
    }catch(e){
      print(e);
    }
  }
  Future addtoFav(Article article)async{
    isloading = true;
    update();
    var result= await itemServices.addtoFavorit(article);
    isloading=false;
    update();
    return result;
  }
  removeFromfav(int id)async{
    itemServices.removeFromFavorit(id);
    int index= favoritItems.indexWhere((element) => element.id==id);
    favoritItems.removeAt(index);
    update();
  }
}