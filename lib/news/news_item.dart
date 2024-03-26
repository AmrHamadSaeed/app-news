import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/news/news_item_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime publishedAtDate = DateTime.parse(news.publishedAt ?? '');
    Duration diff = now.difference(publishedAtDate);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.30,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            news.author ?? "",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: MyTheme.greyColor,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(news.title ?? "",
              style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            height: 10,
          ),
          Text(
            '${diff.inHours} hours ago' ?? "",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: MyTheme.greyColor,
                ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
