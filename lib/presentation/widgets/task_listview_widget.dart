import 'package:flutter/material.dart';
import 'package:tasklist_app/data/models/task_model.dart';
import 'package:tasklist_app/presentation/constants/custom_colors.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key, required this.tasks});

  // Lista de objetos de tipo Task -> Model
  final List<Task> tasks;

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          // Obteniendo el index de la lista task
          Task currentTask = widget.tasks[index];
          // Container de tarea
          return Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 23),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: ListTile(
              leading: Checkbox(
                value: currentTask.isCompleted,
                onChanged: (value) {
                  setState(() {
                    currentTask.isCompleted = value!;
                  });
                },
              ),
              contentPadding: const EdgeInsets.only(left: 13),

              // Texto de la tarea
              title: Text(
                // mostrando la 'tarea' de la lista task
                currentTask.task,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.textColor,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    widget.tasks.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
