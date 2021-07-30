import 'package:dio/dio.dart';
import 'package:kanban/helpers/api.dart';
import 'package:kanban/helpers/exceptions.dart';
import 'package:kanban/helpers/models.dart';

class ListProvider {
  Future<KanbanModels> getKanban() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet();
      if (response.statusCode == 200) {
        return KanbanModels.fromJson(response.data);
      }
      throw KanbanExceptions.catchError(response);
    } catch (e) {
      throw KanbanExceptions.catchError(e);
    }
  }
}
