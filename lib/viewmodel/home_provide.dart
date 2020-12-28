import 'package:interview/base/base.dart';
import 'package:interview/data/category.dart';
import 'package:interview/model/home_service.dart';
import 'package:rxdart/rxdart.dart';

class HomeProvide extends BaseProvide {
  //分类列表数据
  List<CategoryResponse> categorys = [];
  //是否登录
  bool _isLogin = false;
  final HomeService homeService = HomeService();
  HomeProvide(){
    _isLogin = false;
  }


  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  bool get isLogin => _isLogin;
  //获取分类列表
  Observable getCategoryList(){
    return homeService.getCategoryList().doOnData((result) {
      var list = result.data as List;
      this.categorys.addAll(list.map((map) => CategoryResponse.fromJson(map)));
      this.notifyListeners();
    }).doOnError((e, stacktrace) {
    })
        .doOnListen(() {
    })
        .doOnDone(() {
    });
  }
}
