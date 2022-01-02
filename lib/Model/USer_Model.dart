
import 'package:flutter/cupertino.dart';

class UserModel {
  String user_id;
  String user_name;
  String email;
  String password;
  bool isFavourit;

  UserModel(this.user_id, this.user_name, this.email, this.password,{this.isFavourit=false});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'password': password,
      //'isFavourit':isFavourit
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    user_name = map['user_name'];
    email = map['email'];
    password = map['password'];
    //isFavourit=map['isFavourit']==1;
  }

}
