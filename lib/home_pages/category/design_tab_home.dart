import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';

class DesignTabHome extends StatelessWidget {
  bool isSelected ;
  Source source;
  DesignTabHome({required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyTheme.primaryLightColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? MyTheme.primaryLightColor : Colors.transparent
      ),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: isSelected ? MyTheme.whiteColor : MyTheme.primaryLightColor,
        ),
      ),
    );
  }
}
