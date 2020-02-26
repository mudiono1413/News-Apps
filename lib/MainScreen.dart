import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newspp/DetailNewsScreen.dart';
import 'package:newspp/NewsByCategoryScreen.dart';
import 'package:newspp/model/NewsModel.dart';
import 'package:newspp/presenter/NewsPresenter.dart';
import 'package:newspp/util/listNewsCategory.dart';
import 'package:newspp/widget/CardNews.dart';
import 'package:newspp/widget/CardNewsMenu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> implements GetNewsContract {
  GetNewsPresenter _getNewsPresenter;
  _MainScreenState() {
    _getNewsPresenter = new GetNewsPresenter(this);
  }

  ScrollController controller;
  bool isLoading;

  List<Articles> listNewsArticles = [];

  @override
  void initState() {
    _getNewsPresenter.getNews();
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      // startLoader();
    }
  }

  

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("BERITA"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    listNewsCategory == null ? 0 : listNewsCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  Map listNewsCategories = listNewsCategory[index];
                  return InkWell(
                      onTap: () {
                        print("hai" + listNewsCategories["name"].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsByCategoryScreen(
                                    category: listNewsCategories["name"],
                                  )),
                        );
                        // _getNewsPresenter.getNewsbyCategory(listNewsCategories["name"]);
                      },
                      child: CardNewMenu(
                        name: listNewsCategories["name"],
                      ));
                },
              ),
            ),
            Container(
                height: ScreenUtil().setHeight(1500),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:
                      listNewsArticles == null ? 0 : listNewsArticles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return 
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => DetailNewsScreen(
                    //                 url: listNewsArticles[index].url,
                    //                 title: listNewsArticles[index].title,
                    //               )),
                    //     );
                    //   },
                    //   child:
                       CardNewsList(
                        articles: listNewsArticles[index],
                      );
                    // );
                  },
                )),
          ],
        ));
  }

  @override
  void getNewsError(String errorText) {
    print("gagal get news" + errorText);
  }

  @override
  void getNewsSucces(List<Articles> articles) async {
    print("suskses " + articles.toString());
    listNewsArticles.clear();
    setState(() {
      for (var i = 0; i < articles.length; i++) {
        listNewsArticles.add(articles[i]);
      }
    });
  }

  @override
  void getNewsByCategoryError(String errorText) {
    // TODO: implement getNewsByCategoryError
  }

  @override
  void getNewsByCategorySucces(List articles) {
    print("data by category" + articles.length.toString());
    // TODO: implement getNewsByCategorySucces
  }
}
