import 'package:flutter/material.dart';
import 'package:newspp/model/NewsModel.dart';
import 'package:newspp/presenter/NewsPresenter.dart';
import 'package:newspp/widget/CardNews.dart';

import 'DetailNewsScreen.dart';

class NewsByCategoryScreen extends StatefulWidget {
  NewsByCategoryScreen({this.category});
  final String category;
  @override
  _NewsByCategoryScreenState createState() => _NewsByCategoryScreenState();
}

class _NewsByCategoryScreenState extends State<NewsByCategoryScreen>
    implements GetNewsContract {
  GetNewsPresenter _getNewsPresenter;
  _NewsByCategoryScreenState() {
    _getNewsPresenter = new GetNewsPresenter(this);
  }

  List<Articles> listArticles = [];
  List<Articles> listSearch = [];
  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    listSearch.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    listArticles.forEach((f) {
      if (f.title.contains(text) ) {
        listSearch.add(f);
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    _getNewsPresenter.getNewsbyCategory(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toUpperCase()),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.blue,
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            Expanded(
              child: listSearch.length != 0 || controller.text.isNotEmpty ?
              
               ListView.builder(
                itemCount: listSearch == null ? 0 : listSearch.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailNewsScreen(
                                  url: listSearch[index].url,
                                  title: listArticles[index].title,
                                )),
                      );
                    },
                    child: CardNewsList(
                      articles: listArticles[index],
                    ),
                  );
                },
              ) :
               ListView.builder(
                itemCount: listArticles == null ? 0 : listArticles.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailNewsScreen(
                                  url: listArticles[index].url,
                                  title: listArticles[index].title,
                                )),
                      );
                    },
                    child: CardNewsList(
                      articles: listArticles[index],
                    ),
                  );
                },
              ) ,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void getNewsByCategoryError(String errorText) {
    // TODO: implement getNewsByCategoryError
  }

  @override
  void getNewsByCategorySucces(List articles) {
    // TODO: implement getNewsByCategorySucces
    print(" object  " + articles.length.toString());
    listArticles.clear();
    for (var i = 0; i < articles.length; i++) {
      setState(() {
        listArticles.add(Articles.fromJson(articles[i]));
      });
    }
  }

  @override
  void getNewsError(String errorText) {
    // TODO: implement getNewsError
    print(" error  " + errorText.toString());
  }

  @override
  void getNewsSucces(List<Articles> articles) {
    // TODO: implement getNewsSucces
    print(" object  " + articles.toString());
  }
}
