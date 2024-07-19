class ToDoModel {
  final String title;
  final DateTime dateTime;

  ToDoModel({required this.title, required this.dateTime});

  @override
  String toString() {
    return 'ToDoModel(title:$title,dateTime:$dateTime)';
  }
}
