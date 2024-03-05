

import 'package:app_news/home_pages/category/category_details.dart';
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: CategoryDetails.routeName,
      routes: {
        CategoryDetails.routeName: (context) => CategoryDetails(),
      },
      theme: MyTheme.LightTheme,

    );
  }

}