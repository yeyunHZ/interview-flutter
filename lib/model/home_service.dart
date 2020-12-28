import 'package:interview/api/net_utils.dart';
import 'package:interview/data/base.dart';
import 'package:rxdart/rxdart.dart';

class HomeService{
  //获取类型列表
  Observable<BaseResponse> getCategoryList(){
    var url = 'category/list';
    var response = get(url);
    return response;
  }
}
