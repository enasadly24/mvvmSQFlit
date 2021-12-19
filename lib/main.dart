
import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Pages/newsListPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main()=> runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        create: (_)=>NewsArticleListViewModel()..populateTopHeadlines(),
        child: NewsList(),
      )
    );
  }
}
