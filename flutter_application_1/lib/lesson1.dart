import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// void main() {
//   Dio().get("https://geek.itheima.net/v1_0/channels").then((res) {
//     print(res);
//   }).catchError((object) {
//     print(object);
//   });
// }
void main() {
  runApp(Mainpage());
}

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List<Map<String, dynamic>> _datalistconvert = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  void _getdata() async {
    Diouilt tools = Diouilt();
    Response<dynamic> rec = await tools.get("channels");
    Map<String, dynamic> data = rec.data as Map<String, dynamic>;
    List dataList = data["data"]["channels"];
    // print(dataList.cast<Map<String, dynamic>>() as List<Map<String, dynamic>>);
    _datalistconvert =
        dataList.cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "bzd",
      home: Scaffold(
        appBar: AppBar(title: Text("频道管理"), centerTitle: true),
        body: Stack(
          children: [
            GridView.extent(
              maxCrossAxisExtent: 140,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3,
              children: List.generate(_datalistconvert.length, (index) {
                return child(
                  item: _datalistconvert[index],
                  onDelete: () {
                    setState(() {
                      _datalistconvert.removeAt(index);
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class child extends StatelessWidget {
  // List _childList=[];
  final Map<String, dynamic> item;
  final VoidCallback onDelete;
  const child({super.key, required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            item["name"] ?? "空",
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              onDelete();
            },
            icon: Icon(Icons.delete),
            splashRadius: 10,
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(iconSize: 10),
          ),
        ),
      ],
    );
  }
}

class Diouilt {
  final Dio _dio = Dio();
  Diouilt() {
    // _dio.options.baseUrl = "https://geek.itheima.net/v1_0/channels";
    // _dio.options.connectTimeout = Duration(seconds: 10);
    // _dio.options.sendTimeout = Duration(seconds: 10);
    // _dio.options.receiveTimeout = Duration(seconds: 10);
    _dio.options
      ..baseUrl = "https://geek.itheima.net/v1_0/"
      ..connectTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10);
    //..代表连续赋值的写法
    _addInterceotor();
  }

  //拦截器
  void _addInterceotor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (context, handler) {
          handler.next(context);
        },
        onError: (error, handler) {
          handler.reject(error);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
      ),
    );
  }

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}
