part of 'list_bloc.dart';

@immutable
abstract class ListState {}

class ListInitial extends ListState {}

class ListLoaded extends ListState {
  final KanbanModels model;
  ListLoaded(this.model);
}

class KanbanError extends ListState {
  final KanbanExceptions message;
  KanbanError(this.message);
}
