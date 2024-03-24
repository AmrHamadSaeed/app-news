import 'package:app_news/model/category_home.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
CategoryDataModel categoryDataModel;
int index ;
CategoryItem({required this.categoryDataModel , required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDataModel.color,
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(25) ,
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 == 0 ? 30 : 0),
          bottomRight: Radius.circular(index %2 == 0 ? 0 : 30)
          
        ),
      ),
      child: Column(
        children: [
          Image.asset(categoryDataModel.imagePath,
          height: MediaQuery.of(context).size.height*0.15,),
          Text(categoryDataModel.title,
          style: Theme.of(context).textTheme.titleLarge,),
        ],
      ),
    );
  }
}
