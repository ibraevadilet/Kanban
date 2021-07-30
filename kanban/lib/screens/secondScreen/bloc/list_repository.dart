import 'package:kanban/helpers/models.dart';
import 'package:kanban/screens/loginScreen/login_bloc/kanban_provider.dart';
import 'package:kanban/screens/secondScreen/bloc/list_provider.dart';

class ListRepository {
  Future<KanbanModels> getKanban() {
    ListProvider provider = ListProvider();
    return provider.getKanban();
  }
}
