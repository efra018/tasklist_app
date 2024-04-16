class Task {
  final int id;
  final String? userName;
  final String task;
  bool isCompleted;

  Task({
    required this.id,
    this.userName,
    required this.task,
    this.isCompleted = false,
  });

  // static fromMap(Map<String, dynamic> taskMap) {}
  // Map<String, dynamic> mapTask() {
  //   return {
  //     'id': id,
  //     'task': task,
  //     'isCompleted': isCompleted,
  //   };
  // }
}
