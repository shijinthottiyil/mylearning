part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class TodoAddEvent extends TodoEvent {
  final ToDoModel toDoModel;

  const TodoAddEvent({required this.toDoModel});
  @override
  List<Object> get props => [];
}
