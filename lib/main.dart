

import 'package:app_news/home_pages/category/category_details.dart';
import 'package:app_news/home_pages/main_home/home_screen.dart';
import 'package:app_news/home_pages/main_home/search_words/search_words.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/news/news_item_details.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsItemDetails.routeName: (context) => NewsItemDetails(),
        SearchWords.routeName: (context) => SearchWords(),
      },
      theme: MyTheme.LightTheme,

    );
  }

}