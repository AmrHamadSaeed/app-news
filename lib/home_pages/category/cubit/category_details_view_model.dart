import 'package:app_news/api/api_manager.dart';
import 'package:app_news/home_pages/category/cubit/states.dart';
import 'package:app_news/sources.repository/dataSource/source_remote_data_source_impl.dart';
import 'package:app_news/sources.repository/repository/source_repository_impl.dart';
import 'package:app_news/sources.repository/source_repository_contract.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates>{
 late SourceRepositoryContract repositoryContract;
late SourceRemoteDataSource remoteDataSource;
late ApiManager apiManager;

  CategoryDetailsViewModel():super(SourceLoadingState()){
 apiManager = ApiManager();
 remoteDataSource = SourceRemoteDataSourceImp(apiManager: apiManager);
  repositoryContract = SourceRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  // todo: hold data - handle logic

void getSources(String categoryId)async{
  try {
    var response = await repositoryContract.getSources(categoryId);
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