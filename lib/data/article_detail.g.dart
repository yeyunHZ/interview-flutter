part of 'article_detail.dart';


ArticleDetailResponse _$ArticleDetailResponseFromJson(Map<String, dynamic> json) {
  return ArticleDetailResponse(
      nextId: json['nextId'] as int,
      isLike: json['isLike'] as bool,
      prevId: json['prevId'] as int,
      isFavorite: json['isFavorite'] as bool,
      likeNum: json['likeNum'] as int,
      article:ArticleDetail.fromJson(json['article'])
  );
}

Map<String, dynamic> _$ArticleDetailResponseToJson(ArticleDetailResponse articleDetailResponse) =>
    <String, dynamic>{
      'nextId': articleDetailResponse.nextId,
      'isLike': articleDetailResponse.isLike,
      'prevId': articleDetailResponse.prevId,
      'isFavorite': articleDetailResponse.isFavorite,
      'likeNum': articleDetailResponse.likeNum,
      'article': articleDetailResponse.toJson()
    };

ArticleDetail _$ArticleDetailFromJson(Map<String, dynamic> json) {
  return ArticleDetail(id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String,
      showType: json['showType'] as int);
}

Map<String, dynamic> _$ArticleDetailToJson(ArticleDetail articleDetail) =>
    <String, dynamic>{
      'id': articleDetail.id,
      'title': articleDetail.title,
      'content': articleDetail.content,
      'imageUrl': articleDetail.imageUrl,
      'showType': articleDetail.showType
    };