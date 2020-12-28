part of 'article.dart';


ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return ArticleResponse(id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String,
      viewNum: json['viewNum'] as int);
}

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse articleResponse) =>
    <String, dynamic>{
      'id': articleResponse.id,
      'categoryId': articleResponse.categoryId,
      'title': articleResponse.title,
      'content': articleResponse.content,
      'imageUrl': articleResponse.imageUrl,
      'viewNum': articleResponse.viewNum
    };
