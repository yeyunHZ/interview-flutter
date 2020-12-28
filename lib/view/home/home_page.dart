import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/base/app_config.dart';
import 'package:interview/view/home/category_item.dart';
import 'package:interview/viewmodel/home_provide.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
//主页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  HomeProvide homeProvide = HomeProvide();
  final _subscriptions = CompositeSubscription();

  @override
  Widget build(BuildContext context) {
    EdgeInsets paddings = MediaQuery.of(context).padding;
    // TODO: implement build
    return ChangeNotifierProvider.value(
      value: homeProvide,
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.fromLTRB(0, paddings.top + 50, 0, paddings.bottom),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset("images/ic_launcher.png", width: 50, height: 50),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "刷面试宝典拿offer,再也不用担心面试造火箭啦！ ",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Container(child: Consumer<HomeProvide>(
                builder: (build, provide, _) {
                  return homeProvide.categorys.length > 0
                      ? _buildListView()
                      : AppConfig.initLoading(false);
                },
              ),margin: EdgeInsets.fromLTRB(0, 0, 0, 30),),
              // Offstage(
              //   offstage: homeProvide.isLogin != false,
              //   child: Container(
              //     height: 40,
              //     margin: EdgeInsets.fromLTRB(10, 0, 10,0),
              //     child: DecoratedBox(decoration: BoxDecoration(
              //         border: Border.all(color: Colors.green),
              //         borderRadius: BorderRadius.all(Radius.circular(4.0))
              //     ),
              //         child: Container(
              //           alignment: Alignment.center,
              //           child: Text('登录查看我的收藏'
              //             ,style: TextStyle(color: Colors.green,fontSize: 16),),
              //         )),
              //   ),
              // )


            ],
          ),
        ),
      )),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) =>
          CategoryItem(homeProvide.categorys[index]),
      itemCount: homeProvide.categorys.length,
    );
  }

  @override
  void initState() {
    var subscription = homeProvide.getCategoryList().listen((result) {});
    _subscriptions.add(subscription);
  }

  @override
  void dispose() {
    super.dispose();
    _subscriptions.dispose();
  }
}
