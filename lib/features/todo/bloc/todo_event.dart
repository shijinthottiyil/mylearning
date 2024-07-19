part of 'todo_bloc.dart';

sealed class ToDoEvent {}

final class AddToDo extends ToDoEvent {
  final String title;

  AddToDo({required this.title});
}
