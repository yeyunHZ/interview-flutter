import 'package:interview/api/net_utils.dart';
import 'package:interview/data/base.dart';
import 'package:rxdart/rxdart.dart';

class ListService{
  //获取文章列表
  Observable<BaseResponse> getArticleList(int categoryId,int page){
    var url = "article/list?categoryId=${categoryId}&page=${page}";
    var response = get(url);
    return response;
  }

  //搜索文章列表
  Observable<BaseResponse> searchArticleList(int categoryId,String keyWord){
    var url = "article/search?categoryId=${categoryId}&keyWord=${keyWord}";
    var response = get(url);
    return response;
  }

}
