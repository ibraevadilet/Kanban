import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kanban/helpers/exceptions.dart';
import 'package:kanban/helpers/models.dart';
import 'package:kanban/screens/loginScreen/login_bloc/kanban_repository.dart';
import 'package:meta/meta.dart';
part 'kanban_event.dart';
part 'kanban_state.dart';

class KanbanBloc extends Bloc<KanbanEvent, KanbanState> {
  KanbanRepository repository = KanbanRepository();

  KanbanBloc(this.repository) : super(KanbanInitial());

  @override
  Stream<KanbanState> mapEventToState(
    KanbanEvent event,
  ) async* {
    if (event is PostKanbanEvent) {
      var json = {"username": event.username, "password": event.password};

      try {
        yield KanbanInitial();
        var data = await repository.postLoginData(json);
        yield Authorization(data);
      } catch (e) {
        yield KanbanError(KanbanExceptions.catchError(e));
      }
    }
  }
}
