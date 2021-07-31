part of 'list_bloc.dart';

@immutable
abstract class ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  final List<KanbanModels> model;
  ListLoaded(this.model);
}

class ListError extends ListState {
  final KanbanExceptions message;
  ListError(this.message);
}
