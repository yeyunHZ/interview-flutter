import 'package:interview/base/base.dart';
import 'package:interview/data/article.dart';
import 'package:interview/model/list_service.dart';
import 'package:rxdart/rxdart.dart';

class ListProvide extends BaseProvide{
  final ListService listService = ListService();
  //题目列表
  List<ArticleResponse> articleList = [];
  List<ArticleResponse> searchList ;


  //获取题目列表
  Observable getArticleList(int categoryId,int page){
    return listService.getArticleList(categoryId, page).doOnData((result) {
      var list = result.data['list'] as List;
      if(page == 1){
        this.articleList = [];
      }
      this.articleList.addAll(list.map((map) => ArticleResponse.fromJson(map)));
      notifyListeners();
    })
       .doOnError((e, stacktrace) {
    })
        .doOnListen(() {
    })
        .doOnDone(() {
    });

  }

  Observable searchArticleList(int categoryId,String keyWord){
    return listService.searchArticleList(categoryId, keyWord).doOnData((result) {
      var list = result.data as List;
      this.searchList = [];
      this.searchList.addAll(list.map((map
          ) => ArticleResponse.fromJson(map)));
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