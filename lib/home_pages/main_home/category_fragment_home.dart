import 'package:app_news/home_pages/category/category_item.dart';
import 'package:app_news/model/category_home.dart';
import 'package:flutter/material.dart';

class CategoryFragment extends StatelessWidget {

var categoriesList = CategoryDataModel.getCategories();

Function onCategoryItemClick;
CategoryFragment({required this.onCategoryItemClick});
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \n of interest',
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
