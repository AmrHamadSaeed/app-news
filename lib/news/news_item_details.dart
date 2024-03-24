import 'package:app_news/home_pages/category/category_source_details.dart';
import 'package:app_news/model/NewsResponse.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/news/news_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetails extends StatelessWidget {
  static const routeName = 'news_item_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as News;

    DateTime now = DateTime.now();
    DateTime publishedAtDate = DateTime.parse(args.publishedAt ?? '');
    Duration diff = now.difference(publishedAtDate);
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
          appBar: AppBar(
            leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          },
            ),
            title: Text(
              args.title?.substring(0,13)?? '',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                      height: MediaQuery.of(context).size.height * 0.35,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        backgroundColor: MyTheme.primaryLightColor,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    args.author ?? "",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyTheme.greyColor,
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(args.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${diff.inHours} hours ago' ?? "",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: MyTheme.greyColor,
                        ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    args.description ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async{
                          final Uri url = Uri.parse(args.url ??'');
                          if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                          }

                        },
                          child:Text(
                            'View Full Article',
                            style:Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 15,
                            ),
                          )),
                      Icon(Icons.arrow_right,size: 30,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
