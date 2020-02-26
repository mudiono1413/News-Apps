

import 'package:newspp/Api/Api.dart';
import 'package:newspp/model/NewsModel.dart';

abstract class GetNewsContract {
  void getNewsSucces (List<Articles> articles);
  void getNewsError(String errorText);
  void getNewsByCategorySucces (List articles);
  void getNewsByCategoryError(String errorText);
}

class GetNewsPresenter {
  GetNewsContract view;
  RestDataSource api = new RestDataSource();
  GetNewsPresenter(this.view);

  getNews(){
    api.getNews().then((List data){
      view.getNewsSucces(data);
    }).catchError((onError){
      view.getNewsError(onError.toString());
    });
  }
  getNewsbyCategory(String category){
    api.getNewsByCategory(category).then((List data){
      view.getNewsByCategorySucces(data);
    }).catchError((onError){
      view.getNewsByCategoryError(onError.toString());
    });
  }
}