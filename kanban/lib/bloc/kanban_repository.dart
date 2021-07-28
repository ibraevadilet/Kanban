import 'package:kanban/bloc/kanban_provider.dart';
import 'package:kanban/helpers/models.dart';

class KanbanRepository {
  Future<KanbanModels> getRandom() {
    KanbanProvider provider = KanbanProvider();

    return provider.getRandom();
  }
}
