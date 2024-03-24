
import 'package:app_news/home_screen.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/news/news_widget.dart';
import 'package:app_news/news/news_item_details.dart';
import 'package:flutter/material.dart';

import 'model/SourceResponse.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Source source;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: HomeScreen.routeName,
      routes: {

        HomeScreen.routeName: (context) => HomeScreen(),
        NewsItemDetails.routeName: (context) => NewsItemDetails(),
      },
      theme: MyTheme.LightTheme,

    );
  }

}