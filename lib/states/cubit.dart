
import 'package:mvvm_buildrealproject/DataBase/APIdb.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/states/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FavoriteCubit extends Cubit<FavouriteStates>{
   FavoriteCubit():super(InitFavouriteState());
   static FavoriteCubit get(context) {
     return BlocProvider.of(context);
   }
   List<NewsArticle> myList=[];


   addToMyList(NewsArticle singleItem)async{
     myList.add(singleItem);
     await DatabaseHelper.insertData(singleItem);
     emit(AddingToListState());
   }

   removeFromMyList(NewsArticle singleItem){
     for(int i=0;i<myList.length;i++){
       if(myList[i].title==singleItem.title){
         myList.remove(myList[i]);
       }
     }
     DatabaseHelper.deleteOneItem(singleItem);
     emit(RemovingFromListState());
   }
   fetchDataFromSQL()async{
     var listOfNews= await DatabaseHelper.getData();
     var list= listOfNews.map((e) => NewsArticle.fromJson(e)).toList();
     myList=list;
     emit(FetchDataFromMySqlState());
   }
}