part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoDataState extends TodoState {
  final List<ToDoModel> toDoModelList;
  const TodoDataState({required this.toDoModelList});

  @override
  List<Object> get props => [toDoModelList];
}
