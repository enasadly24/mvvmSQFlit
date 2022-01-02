import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Login.dart';
import 'package:mvvm_buildrealproject/Pages/newsListPage.dart';
import 'package:mvvm_buildrealproject/Services/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class Spalsh_Screen extends StatefulWidget {

  @override
  _Spalsh_ScreenState createState() => _Spalsh_ScreenState();
}

class _Spalsh_ScreenState extends State<Spalsh_Screen> {
bool isLoggedIn=false;
  check() async{
    WidgetsFlutterBinding.ensureInitialized();
   // SharedPreferences prefs = await SharedPreferences.getInstance();
    var Username = SharedPref.ReturnShared().getString("User_Id");
    print(Username);
    if(Username==null){
      isLoggedIn=false;
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
    }else{
      isLoggedIn=true;
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsList()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return  SplashScreen(
      seconds: 5,
      navigateAfterSeconds:isLoggedIn?Login():NewsList(),
      //onClick:()=>isLoggedIn?Login():NewsList(),
      title:Text('Welcome In NewsPaper App',
        textAlign:TextAlign.center ,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,),
      ),
      image:  Image.asset("Images/splash_Logo.png",fit: BoxFit.fill,),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
      photoSize: 100.0,

    );  }
}
