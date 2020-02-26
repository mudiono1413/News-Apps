

class Articles {

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Articles({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content
  });
 Articles.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

class Source {
  int id;
  String name;

  Source({
    this.id,
    this.name
  });
}
