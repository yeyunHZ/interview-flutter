import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class ArticleResponse {
  int id;
  int categoryId;
  String title;
  String content;
  String imageUrl;
  int viewNum;
  ArticleResponse({this.id,this.categoryId,this.title,this.content,this.imageUrl,this.viewNum});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
