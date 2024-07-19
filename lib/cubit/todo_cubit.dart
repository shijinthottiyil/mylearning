import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/cubit/todo_model.dart';

class ToDoCubit extends Cubit<List<ToDoModel>> {
  ToDoCubit() : super([]);

  // Method To Add ToDo.
  void addTodo({required String title}) {
    final ToDoModel toDoModel =
        ToDoModel(title: title, dateTime: DateTime.now());
    final List<ToDoModel> updatedList = [...state, toDoModel];
    emit(updatedList);
  }
}
