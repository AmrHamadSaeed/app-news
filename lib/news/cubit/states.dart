import 'package:app_news/model/NewsResponse.dart';

abstract class NewsWidgetStates{}

class NewsInitialState extends NewsWidgetStates{}
class NewsLoadingState extends NewsWidgetStates{}

class NewsErrorState extends NewsWidgetStates{
  String? errorMessage;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsWidgetStates{
  List<News> newsList = [];
  NewsSuccessState({required this.newsList});
}
