
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:interview/data/base.dart';
import 'http_util.dart';

Observable<BaseResponse> get(String url, {Map<String, dynamic> params}) =>
    Observable.fromFuture(_get(url, params: params)).delay(Duration(milliseconds: 500)).asBroadcastStream();

Future<BaseResponse> _get(String url, {Map<String, dynamic> params}) async {
  var response = await HttpUtil().dio.get(url, queryParameters: params);
  var res = BaseResponse.fromJson(response.data);
  if (res.code != 200) {
    Fluttertoast.showToast(
        msg: res.message
    );
  }
  return res;
}


Observable<BaseResponse> post(String url,{dynamic body,Map<String, dynamic> queryParameters}) =>
    Observable.fromFuture(_post(url, body,queryParameters: queryParameters)).delay(Duration(milliseconds: 500)).asBroadcastStream();

Future<BaseResponse> _post(String url, dynamic body,{ Map<String, dynamic> queryParameters}) async {
  var response = await HttpUtil().dio.post(url, data: body, queryParameters: queryParameters);
  var res = BaseResponse.fromJson(response.data);
  if (res.code != 200) {
    Fluttertoast.showToast(
        msg: res.message,
        gravity: ToastGravity.CENTER
    );
  }
  return res;
}
