import 'package:flutter/material.dart';
import 'package:interview/base/app_config.dart';
import 'package:interview/viewmodel/list_provide.dart';
import 'package:provider/provider.dart';

import 'article_item.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  ListProvide listProvide;
  int categoryId;

  SearchBarDelegate({this.listProvide,this.categoryId});

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    listProvide.searchList = null;
    listProvide.searchArticleList(categoryId, query).listen((event) {});
    return ChangeNotifierProvider.value(value: listProvide,
        child: Container(
          child: Column(
            children: [
              Expanded(child: Container(
                child: Consumer<ListProvide>(builder: (build, provide, _) {
                  return listProvide!=null&&listProvide.searchList!=null ? (listProvide.searchList.length>0?
                  _buildListView():AppConfig.initLoading(true)) :
                  AppConfig.initLoading(false);
                },),
              ))
            ],
          ),
        ));
  }

  Widget _buildListView() {
    return  ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) =>
          ArticleItem(listProvide.searchList[index]),
      itemCount: listProvide.searchList.length,
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = [];
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        // 创建一个富文本，匹配的内容特别显示
        return ListTile(title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0, query.length),
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
            )
          ],)),
          onTap: () {
            query = suggestionList[index];
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(query)));
          },
        );
      },
    );
  }

}