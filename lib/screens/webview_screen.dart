import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodpedia/models/foodpedia_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: FoodPediaPages.urlPath,
      key: ValueKey(FoodPediaPages.urlPath),
      child: const WebViewScreen(),
    );
  }

  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState(){
    super.initState();
    if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Erik\'s Github Page'),
      ),
      body: const WebView(
        initialUrl: 'https://satriawarn.github.io',
      ),
    );
  }
}
