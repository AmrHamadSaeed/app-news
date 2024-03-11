
import 'package:app_news/home_pages/category/future_tabs/tab_item_design.dart';
import 'package:app_news/news/news.dart';
import 'package:flutter/material.dart';

import '../../../model/SourceResponse.dart';

class TabHomeWidget extends StatefulWidget {
List<Source> sourcesList ;
int selectedIndex = 0;
TabHomeWidget({required this.sourcesList});

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
              tabs : widget.sourcesList.map((source) => TabItem(
                  source: source,
                  isSelected: widget.selectedIndex == widget.sourcesList.indexOf(source),
              )).toList()
            ),
            Expanded(child: NewsWidget(source: widget.sourcesList[widget.selectedIndex])),
          ],
        ),
    );
  }
}
