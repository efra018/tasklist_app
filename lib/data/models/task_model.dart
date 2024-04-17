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

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      task: json['task'],
      userName: json['userName'],
      isCompleted: json['isCompleted'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'userName': userName,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
}
