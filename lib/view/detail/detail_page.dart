
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview/base/app_config.dart';
import 'package:interview/viewmodel/detail_provide.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../photo_view.dart';

class DetailPage extends StatefulWidget{
  final int articleId;
  final int categoryId;

  DetailPage({this.articleId,this.categoryId});

  @override
  State<StatefulWidget> createState() {
    return DetailState(articleId: articleId,categoryId: categoryId);
  }
}
class DetailState extends State<DetailPage>{
  int articleId;
  final int categoryId;
  DetailState({this.articleId,this.categoryId});
  final _subscriptions = CompositeSubscription();

  DetailProvide _detailProvide = DetailProvide();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(value: _detailProvide,
    child: Scaffold(
      appBar: AppBar(
        title: Text("题解"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        padding: EdgeInsets.zero,
        child: Consumer<DetailProvide>(builder: (build,provide,_){
          return _detailProvide.articleDetailResponse == null?AppConfig.initLoading(false)
              : _buildContent();
        },),
      ),
    ),);
  }

  Widget _buildContent(){
    return Center(child:
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
              Container(child: Text(_detailProvide.articleDetailResponse.article.title
                ,textAlign: TextAlign.center,),
              margin: EdgeInsets.fromLTRB(30, 10, 30, 20),),
        Expanded(child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            GestureDetector(
              child: Container(child:
              DecoratedBox(decoration: BoxDecoration(
                  color: Colors.white
              ),child: Container(
                child: Consumer<DetailProvide>(builder: (build,provide,_){
                  return _detailProvide.articleDetailResponse.article.imageUrl!=null
                      &&_detailProvide.articleDetailResponse.article.imageUrl.length>0?
                  CachedNetworkImage(imageUrl: _detailProvide.articleDetailResponse.article.imageUrl,height: 400,):
                  Text(
                      _detailProvide.articleDetailResponse.article.content
                  );
                },),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),),
                margin: EdgeInsets.fromLTRB(20, 30, 20, 10),),
              onTap: (){
                if(_detailProvide.articleDetailResponse.article.imageUrl!=null&&
                _detailProvide.articleDetailResponse.article.imageUrl.length>0){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                      PhotoViewSimpleScreen(
                        imageProvider:NetworkImage(_detailProvide.articleDetailResponse.article.imageUrl),
                        heroTag: 'simple',
                        loadingChild: AppConfig.initLoading(false),
                      )));
                }
              },
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Offstage(offstage: _detailProvide.articleDetailResponse.prevId== 0,
                  child: GestureDetector(
                    child: Container(
                      height: 40,
                      child: DecoratedBox(decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(4.0))
                      ),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text('上一题'
                              ,style: TextStyle(color: Colors.green,fontSize: 16),),
                          )),
                    ),
                    onTap: (){
                      _prevArticle();
                    },
                  ),),
                  Offstage(offstage: _detailProvide.articleDetailResponse.nextId== 0,
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        child: DecoratedBox(decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.all(Radius.circular(4.0))
                        ),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Text('下一题'
                                ,style: TextStyle(color: Colors.green,fontSize: 16),),
                            )),
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      ),
                      onTap: (){
                        _nextArticle();
                      },
                    ),)
                ],
              ),
            )
          ],
        ))

      ],
    ));
  }


  @override
  void initState() {
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _subscriptions.dispose();
  }

  void _loadData(){
    var subscription = _detailProvide.getArticleDetail(articleId, categoryId).listen((event) {

    });
    _subscriptions.add(subscription);
  }

  void _prevArticle(){
    articleId = _detailProvide.articleDetailResponse.prevId;
    _detailProvide.articleDetailResponse = null;
    _loadData();
  }

  void _nextArticle(){
    articleId = _detailProvide.articleDetailResponse.nextId;
    _detailProvide.articleDetailResponse = null;
    _loadData();
  }
}