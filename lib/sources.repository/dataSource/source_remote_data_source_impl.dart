
import 'package:app_news/api/api_manager.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/sources.repository/source_repository_contract.dart';

class SourceRemoteDataSourceImp implements SourceRemoteDataSource{
  ApiManager apiManager ;
  SourceRemoteDataSourceImp({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(String categoryId) async{
   var response = await apiManager.getSources(categoryId);
   return response;
  }

}