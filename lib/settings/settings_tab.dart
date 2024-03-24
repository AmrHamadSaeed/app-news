import 'package:app_news/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/ProviderConfig.dart';
import 'TapLanguageBottom.dart';

class SettingsTab extends StatefulWidget {
  // savePrefs ()async{
  //   SharedPreferences prefs =await SharedPreferences.getInstance();
  //   prefs.setString('en', 'en');
  //   print('success perfs');
  // }
  @override
  State<SettingsTab> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderConfig>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyTheme.whiteColor,
                border: Border.all(color: MyTheme.blackColor),
              ),
              child: InkWell(
                onTap: () {
                  showLanguageBottom();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.languageApp == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: MyTheme.blackColor),
                    ),
                    Icon(Icons.keyboard_arrow_down_sharp),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottom() {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setString('en','amr');
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return TapLanguageBottom();
        });
  }
}
