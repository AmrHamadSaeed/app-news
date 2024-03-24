
import 'package:app_news/api/api_manager.dart';

import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/model/category_home.dart';
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';

import 'tab_home_widget.dart';

class CategorySourceDetails extends StatefulWidget {
static const String routeName = 'category-details';
CategoryDataModel categoryDM;
String searchKey;
CategorySourceDetails({
  required this.categoryDM,
  required this.searchKey
});

  @override
  State<CategorySourceDetails> createState() => _CategorySourceDetailsState();
}

class _CategorySourceDetailsState extends State<CategorySourceDetails> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse?>(
              future: ApiManager.getSources(widget.categoryDM.id),
              builder: (context , snapshot){
                /// handle future loading data
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: MyTheme.primaryLightColor,
                    ),
                  );
                  /// handel user network disable => catch Api getSources (throw e)
                }else if (snapshot.hasError){
                  return Column(
                    children: [
                      Text('Something went wrong '),
                      ElevatedButton(onPressed: (){
                        ApiManager.getSources(widget.categoryDM.id);
                        setState(() {

                        });
                      }, child: Text('Try Again'))
                    ],
                  );
                }
                /// server ( success   == error)
                if (snapshot.data?.status != 'ok'){
                  return Column(
                    children: [
                      Text(snapshot.data!.message!),
                      ElevatedButton(onPressed: (){
                        ApiManager.getSources(widget.categoryDM.id);
                        setState(() {

                        });
                      }, child: Text('Try Again'))
                    ],
                  );
                }
                var sourcesList = snapshot.data?.sources ?? [] ;
                return TabHomeWidget(sourcesList: sourcesList, searchKey: widget.searchKey,);
              }

    );
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
 2834e41a6cd94fb484f8df821c7606fd

 */
