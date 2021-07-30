part of 'list_bloc.dart';

@immutable
abstract class ListEvent {}

class GetListEvent extends ListEvent {
  GetListEvent();
}
