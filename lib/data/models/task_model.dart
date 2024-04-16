class Task {
  final int id;
  final String userName;
  final String task;
  final bool isCompleted;

  Task({
    required this.id,
    required this.userName,
    required this.task,
    this.isCompleted = false,
  });
}
