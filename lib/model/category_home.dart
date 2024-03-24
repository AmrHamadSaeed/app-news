import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static List<CategoryDataModel> getCategories(BuildContext context) {
    /*
    business entertainment general
    health science sports technology
    */
    return [
      CategoryDataModel(
          color: MyTheme.redColor,
          title: AppLocalizations.of(context)!.language,
          id: 'sports',
          imagePath: 'assets/images/ball.png'),
      CategoryDataModel(
          color: MyTheme.brownColor,
          title: AppLocalizations.of(context)!.business,
          id: 'business',
          imagePath: 'assets/images/bussines.png'),
      CategoryDataModel(
          color: MyTheme.pinkColor,
          title: AppLocalizations.of(context)!.health,
          id: 'health',
          imagePath: 'assets/images/health.png'),
      CategoryDataModel(
          color: MyTheme.blueColor,
          title: AppLocalizations.of(context)!.entertainment,
          id: 'entertainment',
          imagePath: 'assets/images/environment.png'),
      CategoryDataModel(
          color: MyTheme.yellowColor,
          title: AppLocalizations.of(context)!.science,
          id: 'science',
          imagePath: 'assets/images/science.png'),
      CategoryDataModel(
          color: MyTheme.darkBlueColor,
          title: AppLocalizations.of(context)!.technology,
          id: 'technology',
          imagePath: 'assets/images/Politics.png'),

    ];
  }
}
