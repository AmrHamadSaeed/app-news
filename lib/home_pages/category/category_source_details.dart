
import 'package:app_news/api/api_manager.dart';
import 'package:app_news/home_pages/category/cubit/category_details_view_model.dart';
import 'package:app_news/home_pages/category/cubit/states.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/model/category_home.dart';
import 'package:app_news/my_theme.dart';
import 'package:app_news/sources.repository/repository/source_repository_impl.dart';
import 'package:app_news/sources.repository/source_repository_contract.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../sources.repository/dataSource/source_remote_data_source_impl.dart';
import 'tab_home_widget.dart';

class CategorySourceDetails extends StatefulWidget {
static const String routeName = 'category-details';
CategoryDataModel categoryDM;
String searchKey;

// late SourceRepositoryContract repositoryContract;
// late SourceRemoteDataSource remoteDataSource;
// late ApiManager apiManager;

CategorySourceDetails({
  required this.categoryDM,
  required this.searchKey,
});
// {
//   apiManager = ApiManager();
//   repositoryContract = SourceRepositoryImpl(remoteDataSource: remoteDataSource);
//   remoteDataSource = SourceRemoteDataSourceImp(apiManager: apiManager);
// }

  @override
  State<CategorySourceDetails> createState() => _CategorySourceDetailsState();
}

class _CategorySourceDetailsState extends State<CategorySourceDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
@override
  void initState() {
    // TODO: implement initState
    viewModel.getSources(widget.categoryDM.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel,SourceStates>(
      bloc: viewModel,
        builder: (context,state){
        if(state is SourceLoadingState){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.primaryLightColor,
            ),
          );
        }else if(state is SourceErrorState){
          return Column(
            children: [
              Text(state.errorMessage!),
              ElevatedButton(
                  onPressed: (){
               viewModel.getSources(widget.categoryDM.id);

              }, child: Text('Try Again'))
            ],
          );
        }else if (state is SourceSuccessState){
          return TabHomeWidget(sourcesList: state.sourcesList, searchKey: widget.searchKey,);
        }
        return Container();
        }
    );






      FutureBuilder<SourceResponse?>(
              future: ApiManager.getSources(
          widget.categoryDM.id,
        ),
        builder: (context, snapshot) {
          /// handle future loading data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );

            /// handel user network disable => catch Api getSources (throw e)
          } else if (snapshot.hasError) {
            return Column(
                    children: [
                      Text('Something went wrong '),
                      ElevatedButton(onPressed: (){
                        ApiManager.getSources(
                          widget.categoryDM.id,
                        );
                        setState(() {

                        });
                      }, child: Text('Try Again'))
                    ],
                  );
                }
                /// server ( success   == error)
                if (snapshot.data?.status != 'ok'){
                  return Column(
                    children: [
                      Text(snapshot.data!.message!),
                      ElevatedButton(onPressed: (){
                        ApiManager.getSources(
                          widget.categoryDM.id,
                        );
                        setState(() {

                        });
                      }, child: Text('Try Again'))
                    ],
                  );
                }
                var sourcesList = snapshot.data?.sources ?? [] ;
                return TabHomeWidget(sourcesList: sourcesList, searchKey: widget.searchKey,);
              }

    );
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
 2834e41a6cd94fb484f8df821c7606fd

 */
