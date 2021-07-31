import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kanban/helpers/exceptions.dart';
import 'package:kanban/screens/loginScreen/loginScreen.dart';
import 'package:kanban/screens/secondScreen/secondScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRequester {
  ListScreen index = new ListScreen();

  static String url = "https://trello.backend.tests.nekidaem.ru/api/v1/";

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String val = prefs.getString("token") ?? "";
    debugPrint("token: $val");
    return val;
  }

  Future<Dio> initDio() async {
    return Dio(BaseOptions(
      baseUrl: url,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "JWT " + await getToken()
      },
      responseType: ResponseType.json,
      receiveTimeout: 10000,
      connectTimeout: 10000,
    ));
  }

  Future<Response> toGet(String url, dynamic params) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: params);
    } catch (e) {
      throw KanbanExceptions.catchError(e);
    }
  }

  Future<Response> toPost(String url, dynamic params) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, data: params);
    } catch (e) {
      throw KanbanExceptions.catchError(e);
    }
  }
}
