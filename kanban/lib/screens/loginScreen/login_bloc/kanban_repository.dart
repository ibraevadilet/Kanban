import 'package:kanban/helpers/models.dart';
import 'package:kanban/screens/loginScreen/login_bloc/kanban_provider.dart';

class KanbanRepository {
  Future postLoginData(json) {
    KanbanProvider provider = KanbanProvider();
    return provider.postLoginData(json);
  }
}
