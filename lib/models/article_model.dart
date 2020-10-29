class ArticleModel {
  final String id;
  final String title;
  final String author;
  final String content;

  ArticleModel({this.id, this.title, this.author, this.content});

  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        author = json['author'] as String,
        content = json['content'] as String;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'author': author,
    'content': content
  };
}
