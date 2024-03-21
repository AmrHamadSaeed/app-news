import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';

class CategoryDataModel {
  String id;
  String title;
  String imagePath;
  Color color;

  CategoryDataModel(
      {required this.color,
      required this.title,
      required this.id,
      required this.imagePath});

  static List<CategoryDataModel> getCategories() {
    /*
    business entertainment general
    health science sports technology
    */
    return [
      CategoryDataModel(
          color: MyTheme.redColor,
          title: 'Sports',
          id: 'sports',
          imagePath: 'assets/images/ball.png'),
      CategoryDataModel(
          color: MyTheme.brownColor,
          title: 'Business',
          id: 'business',
          imagePath: 'assets/images/bussines.png'),
      CategoryDataModel(
          color: MyTheme.pinkColor,
          title: 'Health',
          id: 'health',
          imagePath: 'assets/images/health.png'),
      CategoryDataModel(
          color: MyTheme.blueColor,
          title: 'Entertainment',
          id: 'entertainment',
          imagePath: 'assets/images/environment.png'),
      CategoryDataModel(
          color: MyTheme.yellowColor,
          title: 'Science',
          id: 'science',
          imagePath: 'assets/images/science.png'),
      CategoryDataModel(
          color: MyTheme.darkBlueColor,
          title: 'Technology',
          id: 'technology',
          imagePath: 'assets/images/Politics.png'),

    ];
  }
}
