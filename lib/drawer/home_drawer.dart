import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
static const int categories = 1;
static const int settings = 2;
  Function onSideMenuItemClick;
  HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.10
          ),
          color: MyTheme.primaryLightColor,
          child: Text(
            AppLocalizations.of(context)!.news_app,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 10,),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(settings);
            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 10,),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
