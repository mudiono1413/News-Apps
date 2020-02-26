import 'package:flutter/material.dart';
import 'package:newspp/model/NewsModel.dart';

class DetailArticlesScreen extends StatefulWidget {
  DetailArticlesScreen({
    this.articles
  });
  final Articles articles;
  @override
  _DetailArticlesScreenState createState() => _DetailArticlesScreenState();
}

class _DetailArticlesScreenState extends State<DetailArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.articles.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.network(
            widget.articles.urlToImage
          ),
         Flexible (child: Text(widget.articles.content,style: TextStyle(
           fontSize: 20
         ),)),
         
        ],
      ),
    );
  }
}