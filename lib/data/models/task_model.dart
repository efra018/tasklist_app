class Task {
  final int? id;
  final String? userName;
  final String task;
  bool isCompleted;

  Task({
    this.id,
    this.userName,
    required this.task,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': null,
      'userName': userName,
      'task': task,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      userName: json['userName'],
      task: json['task'],
      isCompleted: json['isCompleted'] == 1,
    );
  }
}
