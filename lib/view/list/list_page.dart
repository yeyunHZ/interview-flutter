import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/base/app_config.dart';
import 'package:interview/view/list/search_bar_delegate.dart';
import 'package:interview/viewmodel/list_provide.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'article_item.dart';
//列表页
class ListPage extends StatefulWidget{
  //类型id
  final int categoryId;
  //类型名称
  final String category;

  ListPage({this.categoryId,this.category});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListState(categoryId: categoryId,category: category);
  }


}
class ListState extends State<ListPage>{
  ListProvide listProvide = ListProvide();
  ScrollController _scrollController = ScrollController();
  final _subscriptions = CompositeSubscription();
  int categoryId;
  int page = 1;
  String category;
  ListState({this.categoryId,this.category});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(value: listProvide
    ,child: Scaffold(
        appBar: AppBar(
          title: Text(category),
          centerTitle: true,
          actions: [
              IconButton(icon: Icon(Icons.search), onPressed: (){
                showSearch(context: context, delegate: SearchBarDelegate(listProvide: listProvide,categoryId:categoryId));
              })
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: Container(
                child: Consumer<ListProvide>(builder: (build,provide,_){
                  return listProvide.articleList.length>0 ?_buildListView() :
                  AppConfig.initLoading(false);
                },),
              ))
            ],
          ),
        ),
      ),);
  }

  @override
  void initState() {
    _loadData();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _onLoadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscriptions.dispose();
  }

  Widget _buildListView() {
    return RefreshIndicator(child: ListView.builder(
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) =>
          ArticleItem(listProvide.articleList[index]),
      itemCount: listProvide.articleList.length,
    ), onRefresh: _onRefresh);
  }

  Future _onRefresh() async{
    page = 1;
    return _loadData();
  }

  Future  _loadData() async{
    var subscription = listProvide.getArticleList(this.categoryId, page).listen((result) {
      return Future.value(true);
    });
    _subscriptions.add(subscription);
  }

  void _onLoadMore() {
    page = page + 1;
    _loadData();
  }

}