import 'package:equatable/equatable.dart';

class ToDoModel extends Equatable {
  final String name;
  final String description;

  const ToDoModel({required this.name, required this.description});

  @override
  String toString() {
    return 'ToDoModel(name:$name,description: $description)';
  }

  @override
  List<Object?> get props => [name, description];
}
