import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/my_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetails extends StatelessWidget {
  static const routeName = 'news_item_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as News;
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

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: args.urlToImage ?? '',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.30,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        backgroundColor: MyTheme.primaryLightColor,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    args.author ?? "",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyTheme.greyColor,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(args.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    args.publishedAt ?? "",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyTheme.greyColor,
                        ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Text(
                        args.description ?? '',
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                  InkWell(
                    onTap: () async{
                      final Uri url = Uri.parse(args.url ??'');
                      if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                      }

                    },
                      child: Text('hello ')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
