import 'package:interview/api/net_utils.dart';
import 'package:interview/data/base.dart';
import 'package:rxdart/rxdart.dart';

class ArticleDetailService{
  //获取文章详情
  Observable<BaseResponse> getArticleDetail(int articleId,int categoryId){
    var url = "/article/info?articleId=${articleId}&categoryId=${categoryId}";
    var response = get(url);
    return response;
  }

}
