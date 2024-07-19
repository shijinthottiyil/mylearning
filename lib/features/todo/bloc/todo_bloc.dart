import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/features/todo/model/todo_model.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class ToDoBLoC extends Bloc<ToDoEvent, ToDoState> {
  ToDoBLoC() : super(ToDoState(listOfToDoModel: [])) {
    on<AddToDo>(
      (AddToDo event, emit) {
        final ToDoModel toDoModel =
            ToDoModel(title: event.title, dateTime: DateTime.now());
        final List<ToDoModel> updatedList = [
          ...state.listOfToDoModel,
          toDoModel
        ];
        final ToDoState updatedToDoState =
            ToDoState(listOfToDoModel: updatedList);
        emit(updatedToDoState);
      },
    );
  }
}
