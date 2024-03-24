import 'package:app_news/drawer/home_drawer.dart';
import 'package:app_news/home_pages/category/category_source_details.dart';
import 'package:app_news/home_pages/main_home/category_fragment_home.dart';
import 'package:app_news/model/category_home.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/settings/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool searchBoolean = false;
  String searchWord = '';

  Widget searchTextField() {
    //add
    return Container(
      height: 40,
      child: TextFormField(
        onChanged: (text) {
          searchWord = text;
          setState(() {});
        },
        decoration: InputDecoration(
          fillColor: MyTheme.whiteColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          hintText: AppLocalizations.of(context)!.search,
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: MyTheme.greyColor, fontSize: 15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: (!searchBoolean)
                  ? Text(
                      selectedMenuItem == HomeDrawer.settings
                          ? 'Settings'
                          : selectedCategory == null
                              ? 'News App'
                              : selectedCategory?.title ?? '',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  : searchTextField(),
              centerTitle: true,
              actions: !searchBoolean
                  ? [
                      !categoryIsSelected
                          ? Container()
                          : IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                setState(() {
                                  searchBoolean = true;
                                });
                              })
                    ]
                  : [
                      IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              searchBoolean = false;
                            });
                          })
                    ]),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
          ),
          body: selectedMenuItem == HomeDrawer.settings
              ? SettingsTab()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryItemClick: onCategoryItemClickAction,
                    )
                  : CategorySourceDetails(
                      categoryDM: selectedCategory!, searchKey: searchWord),
        ),
      ],
    );
  }

  bool categoryIsSelected = false;
  CategoryDataModel? selectedCategory;

  void onCategoryItemClickAction(CategoryDataModel newSelectedCategory) {
    // todo : newSelectedCategory => User
    selectedCategory = newSelectedCategory;
    categoryIsSelected = true;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    categoryIsSelected = false;
    Navigator.pop(context);
    setState(() {});
  }
}
