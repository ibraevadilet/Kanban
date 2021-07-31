import 'package:dio/dio.dart';
import 'package:kanban/helpers/api.dart';
import 'package:kanban/helpers/exceptions.dart';
import 'package:kanban/helpers/models.dart';

class KanbanProvider {
  Future postLoginData(json) async {
    print(json);
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost("users/login/", json);
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      }
      throw KanbanExceptions.catchError(response);
    } catch (e) {
      print(e);
      throw KanbanExceptions.catchError(e);
    }
  }
}
