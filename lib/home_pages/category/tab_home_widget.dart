
import 'package:app_news/home_pages/category/design_tab_home.dart';
import 'package:app_news/news/news_widget.dart';
import 'package:flutter/material.dart';

import '../../model/SourceResponse.dart';

class TabHomeWidget extends StatefulWidget {
List<Source> sourcesList ;
int selectedIndex = 0;
String searchKey;
TabHomeWidget({required this.sourcesList,required this.searchKey});

  @override
  State<TabHomeWidget> createState() => _TabHomeWidget();
}

class _TabHomeWidget extends State<TabHomeWidget> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
             onTap: (index){
               widget.selectedIndex = index;
               setState(() {

               });
             },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs : widget.sourcesList.map((source) => DesignTabHome(
                  source: source,
                  isSelected: widget.selectedIndex == widget.sourcesList.indexOf(source),
              )).toList()
            ),
            Expanded(child: NewsWidget(source: widget.sourcesList[widget.selectedIndex], searchKey: widget.searchKey)),
          ],
        ),
    );
  }
}
