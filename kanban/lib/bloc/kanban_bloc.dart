import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kanban/bloc/kanban_repository.dart';
import 'package:kanban/helpers/exceptions.dart';
import 'package:kanban/helpers/models.dart';
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
    try {
      if (event is GetKanbanEvent) {
        yield KanbanInitial();
        KanbanModels data = await repository.getRandom();
        yield KanbanLoaded(data);
      }
    } catch (e) {
      yield KanbanError(KanbanExceptions.catchError(e));
    }
  }
}
