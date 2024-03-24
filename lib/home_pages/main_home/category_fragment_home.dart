import 'package:app_news/home_pages/main_home/category_item.dart';
import 'package:app_news/model/category_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFragment extends StatelessWidget {

  var categoriesList;

  Function onCategoryItemClick;

  CategoryFragment({required this.onCategoryItemClick});

  Widget build(BuildContext context) {
    categoriesList = CategoryDataModel.getCategories(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ) ,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      onCategoryItemClick(categoriesList[index]);
                    },
                    child: CategoryItem(categoryDataModel: categoriesList[index], index: index));
              },
              itemCount:categoriesList.length ,
            ),
          ),
        ],
      ),
    );
  }
}
