import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {
  final NewsArticleViewModel article;
  NewsArticleDetailsPage({this.article});

  @override
  Widget build(BuildContext context) {
    final Completer <WebViewController> _controller = Completer <WebViewController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}"), // bi y3rd el item el dost 3aleha fi el app bar
      ),
      body: WebView(
        initialUrl: this.article.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webView){
          _controller.complete(webView);
        },
      ),
    );
  }
}
