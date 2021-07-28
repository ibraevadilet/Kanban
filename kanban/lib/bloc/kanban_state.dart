part of 'kanban_bloc.dart';

@immutable
abstract class KanbanState {}

class KanbanInitial extends KanbanState {
  KanbanInitial();
}

class KanbanLoaded extends KanbanState {
  final KanbanModels model;
  KanbanLoaded(this.model);
}

class KanbanError extends KanbanState {
  final KanbanExceptions message;
  KanbanError(this.message);
}
