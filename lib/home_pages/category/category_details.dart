
import 'package:app_news/api/api_manager.dart';

import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';

import 'future_tabs/tab_home_widget.dart';

class CategoryDetails extends StatefulWidget {
static const String routeName = 'category-details';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
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
          body: FutureBuilder<SourceResponse?>(
              future: ApiManager.getSources(),
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
                        ApiManager.getSources();
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
                        ApiManager.getSources();
                        setState(() {

                        });
                      }, child: Text('Try Again'))
                    ],
                  );
                }
                var sourcesList = snapshot.data?.sources ?? [] ;
                return TabHomeWidget(sourcesList: sourcesList);
              }
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
