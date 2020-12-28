import 'package:interview/base/base.dart';
import 'package:interview/data/article.dart';
import 'package:interview/data/article_detail.dart';
import 'package:interview/model/article_detail_service.dart';
import 'package:interview/model/list_service.dart';
import 'package:rxdart/rxdart.dart';

class DetailProvide extends BaseProvide{
  final ArticleDetailService articleDetailService = ArticleDetailService();
  //题目详情
  ArticleDetailResponse articleDetailResponse;

  //获取题目列表
  Observable getArticleDetail(int articleId,int categoryId){
    return articleDetailService.getArticleDetail(articleId, categoryId).doOnData((result) {
      var detail = result.data;
      articleDetailResponse = ArticleDetailResponse.fromJson(detail);
      notifyListeners();
    })
       .doOnError((e, stacktrace) {
    })
        .doOnListen(() {
    })
        .doOnDone(() {
    });

  }


}