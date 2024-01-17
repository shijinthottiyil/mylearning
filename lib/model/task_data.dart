class TaskData {
  int id;
  String title;

  TaskData({required this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }
}
