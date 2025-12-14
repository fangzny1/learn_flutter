import 'package:dio/dio.dart';
import 'package:flutter_application_1/constants/index.dart';

class Diorequest {
  final _dio = Dio();
  Diorequest() {
    _dio.options
      ..baseUrl = GloabalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GloabalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GloabalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GloabalConstants.TIME_OUT);
    _addInterceptor();
  }
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          handler.reject(error);
        },
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
      ),
    );
  }

  get(String url, [Map<String, dynamic>? params]) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  //解析返回result
  _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      if (data["code"] == GloabalConstants.SUCCESS_CODE) {
        return data["result"];
      }
    } catch (e) {
      rethrow;
    }
  }
}

Diorequest diorequest = Diorequest();
