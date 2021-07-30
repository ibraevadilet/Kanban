import 'package:dio/dio.dart';
import 'package:kanban/helpers/exceptions.dart';

class ApiRequester {
  static String url =
      "https://trello.backend.tests.nekidaem.ru/api/v1/users/login/";

  Future<Dio> initDio() async {
    return Dio(BaseOptions(
      baseUrl: url,
      headers: {'Content-Type': 'application/json'},
      responseType: ResponseType.json,
      receiveTimeout: 10000,
      connectTimeout: 10000,
    ));
  }

  Future<Response> toGet() async {
    Dio dio = await initDio();
    try {
      return dio.get(url);
    } catch (e) {
      throw KanbanExceptions.catchError(e);
    }
  }

  Future<Response> toPost(json) async {
    Dio dio = await initDio();
    try {
      return dio
          .post(url, data: {"username": "armada", "password": "FSH6zBZ0p9yH"});
    } catch (e) {
      throw KanbanExceptions.catchError(e);
    }
  }
}
