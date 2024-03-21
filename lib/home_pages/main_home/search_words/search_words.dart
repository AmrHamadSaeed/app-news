
import 'package:app_news/drawer/home_drawer.dart';
import 'package:app_news/home_pages/category/category_details.dart';
import 'package:app_news/home_pages/main_home/category_fragment_home.dart';
import 'package:app_news/home_pages/main_home/home_screen.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/model/category_home.dart';

import 'package:app_news/my_theme.dart';
import 'package:app_news/settings/settings_tab.dart';
import 'package:flutter/material.dart';

class SearchWords extends StatefulWidget {
  static const String routeName = 'search_words';
 // late News news;

  @override
  State<SearchWords> createState() => _SearchWordsState();
}

class _SearchWordsState extends State<SearchWords> {
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
            title: Container(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: MyTheme.whiteColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                        color: Colors.white,
                        width: 1
                    ),
                  ),
                  hintText: 'Search Article',
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.greyColor,
                    fontSize: 15
                  ),
                  suffixIcon: IconButton(
                    onPressed:(){

                    } ,
                    icon: Icon(Icons.search,color: MyTheme.primaryLightColor,),
                  ),
                  prefixIcon: IconButton(
                    onPressed:(){
                     Navigator.popAndPushNamed(context, HomeScreen.routeName);
                    } ,
                    icon: Icon(Icons.close,color: MyTheme.primaryLightColor,),
                  ),
                ),

              ),
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick:onSideMenuItemClick ),
          ),
          body:selectedMenuItem == HomeDrawer.settings?
          SettingsTab()
              :
          selectedCategory == null ?
          CategoryFragment(onCategoryItemClick: onCategoryItemClickAction,)
              :
          CategoryDetails(categoryDM: selectedCategory!),
        ),
      ],
    );
  }
  CategoryDataModel? selectedCategory;
  void onCategoryItemClickAction(CategoryDataModel newSelectedCategory){
    // todo : newSelectedCategory => User
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }
  int selectedMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick(int newSelectedMenuItem){
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
