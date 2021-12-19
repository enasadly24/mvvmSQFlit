import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/Pages/NewsArticleDetailsPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleListViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/newslist.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _controller = TextEditingController();
  @override
  void initState() {
    Future.microtask(() =>Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines());
    super.initState();

  }
  void _showNewsArticlesDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailsPage(article: article)));
  }


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Top News"),
        ),
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
            /*Expanded(
                child: vm.articles.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListNews(articles: vm.articles))*/
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
