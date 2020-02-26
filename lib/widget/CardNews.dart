import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newspp/DetailArticlesScreen.dart';
import 'package:newspp/model/NewsModel.dart';

import '../DetailNewsScreen.dart';

class CardNewsList extends StatefulWidget {
  CardNewsList({this.articles});
  final Articles articles;

  @override
  _CardNewsListState createState() => _CardNewsListState();
}

class _CardNewsListState extends State<CardNewsList> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Stack(children: <Widget>[
      Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailArticlesScreen(
                                articles: widget.articles,
                              )),
                    );
                  },
                  child: Image.network(
                    widget.articles.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailNewsScreen(
                                  url: widget.articles.url,
                                  title: widget.articles.title,
                                )),
                      );
                    },
                    child: Text(
                      widget.articles.title,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(40),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
