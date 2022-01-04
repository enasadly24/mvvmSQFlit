import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_buildrealproject/DataBase/DbHelper.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/genTextFormField.dart';
import 'package:mvvm_buildrealproject/Login_signup_Screens/SignUp.dart';
import 'package:mvvm_buildrealproject/Model/USer_Model.dart';
import 'package:mvvm_buildrealproject/Pages/AppDrawer.dart';
import 'package:mvvm_buildrealproject/Pages/FavoritPage.dart';
import 'package:mvvm_buildrealproject/Pages/NewsArticleDetailsPage.dart';
import 'package:mvvm_buildrealproject/Services/NewsListService.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleListViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/newslist.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsList extends StatefulWidget {

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
 /* NewsServices itemServices= NewsServices();
  List<Article>items=[];
  final HomePageController controller = Get.put(HomePageController());*/
  final _controller = TextEditingController();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  DbHelper dbHelper;
  final _conUserName = TextEditingController();
  String uid;

  @override
  void initState() {
    Future.microtask(() =>Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines());
    getUserData();
    super.initState();
   dbHelper= DbHelper();
  }
  void _showNewsArticlesDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailsPage(article: article)));
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState(() {
      _conUserName.text = sp.getString("User_Name");
       //uid= _conUserName.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('${_conUserName.text}'),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
            }, icon: Icon(Icons.logout)),

          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                //fetch all the news related to the key word entering
                if (value.isNotEmpty) {
                  vm.search(value);
                }
              },
              decoration: InputDecoration(
                  labelText: "Enter search term",
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  )),
            ),

            _buildList(context,vm)
          ],
        ));
  }
  Widget _buildList(BuildContext context,NewsArticleListViewModel vm){
    switch(vm.loadingStatus){
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(child: Text("No Result found"));
      case LoadingStatus.completed:
        return Expanded(child: ListNews(articles: vm.articles,
          onSelected: (article){
          _showNewsArticlesDetails(context, article);
          }
        ),
        );
      default:
        return Align(child: CircularProgressIndicator());
    }
  }

}
