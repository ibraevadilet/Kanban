import 'package:dio/dio.dart';
import 'package:kanban/helpers/exceptions.dart';

class ApiRequester {
  static String url = "https://trello.backend.tests.nekidaem.ru/api/v1/cards/";

  Future<Dio> initDio() async {
    return Dio(BaseOptions(
      baseUrl: url,
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
}
