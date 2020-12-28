import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview/tool/app_tool.dart';
class AppConfig {

  static const baseUrl = 'https://www.rdinterview.top/';
  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Widget getLoadingPlaceHoder(width, height) {
    return new SizedBox(
        width: width,
        height: height,
        child: const CircularProgressIndicator(strokeWidth: 2.0)
    );
  }
  static Widget initLoading(bool showEmpty, [String emptyText = '暂无数据']) {
    return new Center(
      child: showEmpty ? _initEmpty(emptyText) : SizedBox(
          width: 35.0,
          height: 35.0,
          child: const CircularProgressIndicator(strokeWidth: 2.0)
      ),
    );
  }

  static Widget _initEmpty(String emptyText) {
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
      child: new Column(
        children: <Widget>[
          new Icon(Icons.hourglass_empty, color: Colors.grey,size: 60,),
          new Container(height: 10,),
          new Text(emptyText)
        ],
      ),
    );
  }

  static AppTools appTools;

  static init() async {
    appTools = await AppTools.getInstance();
  }
}
