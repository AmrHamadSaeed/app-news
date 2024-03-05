
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
static const String routeName = 'category-details';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child:Image.asset('assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
          fit: BoxFit.cover,) ,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'News App',style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
 2834e41a6cd94fb484f8df821c7606fd

 */
