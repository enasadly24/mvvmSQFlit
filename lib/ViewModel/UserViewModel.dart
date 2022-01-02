

import 'package:flutter/cupertino.dart';
import 'package:mvvm_buildrealproject/Model/USer_Model.dart';

class NewUserViewMode with ChangeNotifier{
  UserModel user;
  bool isFavourit;
  NewUserViewMode({this.user,this.isFavourit=false});
   /* Future<bool> get isFavourit async {
       return await user.isFavourit;
    }*/
  void toggleFavoritStatus(){
   isFavourit=!isFavourit;
    notifyListeners();
  }

}