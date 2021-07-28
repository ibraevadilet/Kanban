part of 'kanban_bloc.dart';

@immutable
abstract class KanbanEvent {}

class GetKanbanEvent extends KanbanEvent {
  GetKanbanEvent();
}
