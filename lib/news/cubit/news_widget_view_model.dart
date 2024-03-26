import 'package:app_news/api/api_manager.dart';
import 'package:app_news/news/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidgetViewModel extends Cubit<NewsWidgetStates>{
  NewsWidgetViewModel():super(NewsLoadingState());
  void getNewsByCategoryId(String sourceId,String searchKey)async{
    try {
      emit(NewsLoadingState());

      var response = await ApiManager.getNewsBySourceId(sourceId, searchKey);
      if (response!.status == 'error'){
        emit(NewsErrorState(errorMessage: response.message));
        return;
      }
      if(response.status == 'ok'){
        emit(NewsSuccessState(newsList: response.articles!));
        return;
      }

    }catch(e){
      emit(NewsErrorState(errorMessage: 'Error Loading News List.'));
    }
  }
}