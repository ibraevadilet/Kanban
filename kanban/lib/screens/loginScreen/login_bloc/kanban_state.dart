part of 'kanban_bloc.dart';

@immutable
abstract class KanbanState {}

class KanbanInitial extends KanbanState {
  KanbanInitial();
}

// class KanbanLoaded extends KanbanState {
//   final KanbanModels model;
//   KanbanLoaded(this.model);
// }

class Authorization extends KanbanState {
  final TokenModel tokenModel;
  Authorization(this.tokenModel);
}

class KanbanError extends KanbanState {
  final KanbanExceptions message;
  KanbanError(this.message);
}
