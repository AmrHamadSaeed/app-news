import 'package:app_news/home_screen.dart';
import 'package:app_news/my_block_observer.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/news/news_item_details.dart';
import 'package:app_news/providers/ProviderConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'model/SourceResponse.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  // Use blocs...
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) => ProviderConfig()..getLanguageSP(), child: MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ProviderConfig provider = Provider.of<ProviderConfig>(context);
    Source source;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsItemDetails.routeName: (context) => NewsItemDetails(),
      },
      theme: MyTheme.LightTheme,
      locale: Locale(provider.languageApp),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

}