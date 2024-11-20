import 'package:dio/dio.dart';

import '../const.dart';

Future<dynamic> requestAPI(String path, method,
    {dynamic payload, String? url, int? networkTimeout}) async {
  Map<String, dynamic> headers = {};

  BaseOptions options = BaseOptions(
      method: method,
      baseUrl: url ?? baseURL,
      connectTimeout: Duration(milliseconds: networkTimeout ?? 50000),
      receiveTimeout: Duration(milliseconds: networkTimeout ?? 50000),
      headers: headers);

  try {
    Dio dio = Dio(options);
    Response response = await dio.request(path, data: payload);
    var data = response.data;
    if (data['status'] == 200) {
      return data["data"];
    }
  } catch (e) {
    throw e.toString();
  }
}
