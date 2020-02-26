

import 'dart:convert';

import 'package:newspp/Api/networkUtil.dart';
import 'package:newspp/model/NewsModel.dart';

class RestDataSource {
  final JsonDecoder decoder = new JsonDecoder();

  NetworkUtil netUtil = new NetworkUtil();

  static final baseUrl = "http://newsapi.org/v2/top-headlines";


  Future<List<Articles>> getNews () async{
    String url = baseUrl+"?country=id&apiKey=e197e7cfc61b480d9865dbdb0eddd488";

    return netUtil.get(url).then((dynamic res){
      List<Articles> listArticles = [];
      for (var i = 0; i < res["articles"].length; i++) {
        listArticles.add(Articles.fromJson(res["articles"][i]));
      }
      return listArticles;
    });
  }
  Future<List> getNewsByCategory (String category) async{
    String url = baseUrl+"?country=id&category="+ category +"&apiKey=e197e7cfc61b480d9865dbdb0eddd488";
    print("url " + url );
    return netUtil.get(url).then((dynamic res){
     
      return res["articles"];
    });
  }

}