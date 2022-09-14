import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';

class ApiClient {
  Dio _dio = Dio();
  Future<List<dynamic>> getdata() async {
    String URL =
        "https://raw.githubusercontent.com/akashverma230/flutter_project/main/course1.json";
    Response response = await _dio.get(URL);
    var body = jsonDecode(response.data);
    print(" $body");
    return body['courses'];
  }
}
