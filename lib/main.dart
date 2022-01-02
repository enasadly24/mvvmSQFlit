
import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Login.dart';
import 'package:mvvm_buildrealproject/Pages/newsListPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/UserViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleListViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main()=> runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 /*   return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        create: (_)=>NewsArticleListViewModel()..populateTopHeadlines(),
        child: Login(),
      )
    );*/
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_)=>NewsArticleListViewModel()..populateTopHeadlines(),
      ),
     ChangeNotifierProvider(create: (_)=>NewUserViewMode())
    ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fresh News",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Spalsh_Screen(),
    ),
    );
  }
}


