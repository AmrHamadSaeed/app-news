import 'dart:convert';

import 'package:app_news/api/api_constant.dart';
import 'package:app_news/model/SourceResponse.dart';
import 'package:http/http.dart' as http;
class ApiManager{
/*
* https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
* 2834e41a6cd94fb484f8df821c7606fd
*/
static Future<SourceResponse?> getSources()async{
  Uri url = Uri.https(ApiConstants.baseUrlServer,ApiConstants.sourcesApiServer,{
    'apiKey' : '2834e41a6cd94fb484f8df821c7606fd'
  });
  try{
    var response =await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return SourceResponse.fromJson(json);
  }catch(e){
    throw e;
  }

}
}