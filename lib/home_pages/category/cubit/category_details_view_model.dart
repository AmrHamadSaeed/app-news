import 'package:app_news/api/api_manager.dart';
import 'package:app_news/home_pages/category/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates>{
  CategoryDetailsViewModel():super(SourceLoadingState());

  // todo: hold data - handle logic

void getSources(String categoryId)async{
  try {
    var response = await ApiManager.getSources(categoryId);
    emit(SourceLoadingState());
    if(response!.status == 'error'){
      emit(SourceErrorState(errorMessage: response.message));
      return;
    }
    if(response.status == 'ok'){
      emit(SourceSuccessState(sourcesList: response.sources!));
      return;
    }
  }catch (e){
    emit(SourceErrorState(errorMessage: "Error Loading Source List"));
  }
}
}