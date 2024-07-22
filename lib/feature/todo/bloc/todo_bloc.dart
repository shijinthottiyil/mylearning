import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mylearning/feature/todo/model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoDataState(toDoModelList: [])) {
    on<TodoAddEvent>(_addToDo);
  }

  void _addToDo(TodoAddEvent event, Emitter<TodoState> emit) {
    final TodoState todoState = state;

    if (todoState is TodoDataState) {
      final List<ToDoModel> currentTodoModelList = todoState.toDoModelList;
      final List<ToDoModel> updatedTodoModelList = [
        event.toDoModel,
        ...currentTodoModelList
      ];
      emit(TodoDataState(toDoModelList: updatedTodoModelList));
    }
  }

  @override
  void onChange(Change<TodoState> change) {
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    log('TodoBloc : $state');
    super.onError(error, stackTrace);
  }
}
