import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class AppTools {
  static String SEARCH_HISTORY_LIST = '_searchHistory_';

  static AppTools _instance;
  static Future<AppTools> get instance async {
    return await getInstance();
  }
  static Future<AppTools> getInstance() async  {
    if (_instance == null) {
      _instance = new AppTools();
      await _instance._init();

    }
    return _instance;
  }
  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }
  static SharedPreferences _spf;



}