import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kanban/helpers/exceptions.dart';
import 'package:kanban/helpers/models.dart';
import 'package:kanban/screens/secondScreen/bloc/list_repository.dart';
import 'package:meta/meta.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListRepository repository = ListRepository();
  ListBloc() : super(ListLoaded(KanbanModels()));

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    try {
      if (event is GetListEvent) {
        // yield ListInitial();
        KanbanModels data = await repository.getKanban();
        yield ListLoaded(data);
      }
    } catch (e) {
      yield KanbanError(KanbanExceptions.catchError(e));
    }
  }
}
