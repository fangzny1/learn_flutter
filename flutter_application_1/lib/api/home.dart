import 'package:flutter_application_1/constants/index.dart';
import 'package:flutter_application_1/utils/DioRequest.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

Future<List<BannerItem>> getBanerListAPI() async {
  return ((await diorequest.get(HttpConstants.Banner_List)) as List).map((
    item,
  ) {
    return BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}
