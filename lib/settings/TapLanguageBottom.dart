import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';
import '../providers/ProviderConfig.dart';

class TapLanguageBottom extends StatefulWidget {
  @override
  State<TapLanguageBottom> createState() => _TapLanguageBottomState();
}

class _TapLanguageBottomState extends State<TapLanguageBottom> {
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderConfig>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.languageApp == 'en'
                ? selectedItem(AppLocalizations.of(context)!.english)
                : unSelectedItem(AppLocalizations.of(context)!.english),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.languageApp == 'ar'
                ? selectedItem(AppLocalizations.of(context)!.arabic)
                : unSelectedItem(AppLocalizations.of(context)!.arabic),
          ),
        ),
      ],
    );
  }

  Widget selectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyTheme.blackColor,
              ),
        ),
        Icon(Icons.check),
      ],
    );
  }

  Widget unSelectedItem(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: MyTheme.blackColor,
          ),
    );
  }
}
