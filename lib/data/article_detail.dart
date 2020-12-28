import 'package:json_annotation/json_annotation.dart';

part 'article_detail.g.dart';

@JsonSerializable()
class ArticleDetailResponse {
  int nextId;
  bool isLike;
  int prevId;
  bool isFavorite;
  int likeNum;
  ArticleDetail article;


  ArticleDetailResponse({this.nextId,this.isLike,this.prevId,this.isFavorite,this.likeNum,this.article});

  factory ArticleDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDetailResponseToJson(this);
}

class ArticleDetail{
  int id;
  String title;
  String content;
  String imageUrl;
  int showType;
  ArticleDetail({this.id,this.title,this.content,this.imageUrl,this.showType});
  factory ArticleDetail.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDetailToJson(this);
}