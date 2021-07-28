import 'package:dio/dio.dart';

class KanbanExceptions {
  String? message;

  KanbanExceptions({this.message});

  static KanbanExceptions catchError(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.connectTimeout) {
        return KanbanExceptions(message: "Время ожидания истекло");
      } else if (error.type == DioErrorType.response) {
        return KanbanExceptions(message: "Ошибка в системе");
      }
    } else {
      return KanbanExceptions(message: "Произошла системная ошибка");
    }
    return KanbanExceptions(message: "Произошла ошибка сервера");
  }
}
