import 'package:dio/dio.dart';
import 'package:kanban/helpers/api.dart';
import 'package:kanban/helpers/exceptions.dart';
import 'package:kanban/helpers/models.dart';

class ListProvider {
  Future<List<KanbanModels>> getKanban(tabIndex) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet("cards/", tabIndex);
      if (response.statusCode == 200) {
        // return KanbanModels.fromJson(response.data);
        response.data.map((val) => print(val));
        return response.data
            .map<KanbanModels>((val) => KanbanModels.fromJson(val))
            .toList();
      }
      throw KanbanExceptions.catchError(response);
    } catch (e) {
      throw KanbanExceptions.catchError(e);
    }
  }
}
