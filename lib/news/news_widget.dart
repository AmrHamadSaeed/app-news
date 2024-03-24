import 'package:app_news/api/api_manager.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/news/news_item.dart';
import 'package:app_news/news/news_item_details.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  String searchKey;
  NewsWidget({required this.source,required this.searchKey});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? '' , widget.searchKey ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong '),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? '',widget.searchKey ?? '');
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          ///    == error
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? '',widget.searchKey ?? '');
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NewsItemDetails.routeName,
                      arguments: newsList[index],
                    );
                  },
                  child: NewsItem(news: newsList[index]));
            },
            itemCount: newsList.length,
          );
        });
  }
}
