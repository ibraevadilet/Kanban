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
  ListBloc() : super(ListLoading());

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    try {
      if (event is GetListEvent) {
        var tabIndex = {"row": event.tabIndex};
        yield ListLoading();
        List<KanbanModels> data = await repository.getKanban(tabIndex);
        yield ListLoaded(data);
      }
    } catch (e) {
      yield ListError(KanbanExceptions.catchError(e));
    }
  }
}
