import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://tech-o6js.onrender.com/api/auth/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response>? getData({
    @required url,
    Map<String, dynamic>? query,
    String? lang = 'en',
    String? authorization,
  }) async {
    dio!.options.headers = {'Content-Type': 'application/json'};
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response>? postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
     var response = await dio!.post(
       url,
       data: data,
       options: Options(
         validateStatus: (status) => true,
         headers: {
           "Content-Type": "application/json",
         },
       ),
     );
      return response;
  }

  static Future<Response>? putData({
    @required String? url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? lang = 'en',
    String? authorization,
  }) async {
    dio!.options.headers = {
      // 'lang': lang,
      // 'Authorization': authorization ?? '',
      'Content-Type': 'application/json'
    };
    return await dio!.put(url!, data: data);
  }
}
