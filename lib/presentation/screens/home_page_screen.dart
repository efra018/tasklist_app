import 'package:flutter/material.dart';
import 'package:tasklist_app/data/local/database_helper.dart';
import 'package:tasklist_app/data/models/task_model.dart';
import 'package:tasklist_app/presentation/constants/custom_colors.dart';
import 'package:tasklist_app/presentation/widgets/addtask_alertdialog_widget.dart';
import 'package:tasklist_app/presentation/widgets/task_listview_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declarando lista vacia de tipo Task -> Model
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTask();
  }

  void _loadTask() async {
    List<Task> loadedTasks = await DatabaseHelper.getAllTasks();

    setState(() {
      tasks = loadedTasks;
    });
  }

  // Funcion para agregar nueva tarea a la lista recibiendo como argumento el nombre la tarea
  void addTask(String taskName) async {
    _loadTask();
  }

  // Funcion _showDialog
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Builder(
          builder: (context) {
            // Widget AlertDialog
            return AddTaskAlertDialog(
              onTaskAdded: addTask,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 3,
          backgroundColor: AppColors.appBarColor,
          centerTitle: true,
          title: const Text(
            'Task List',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 17,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Hola Ender',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TaskListView(
              tasks: tasks,
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: AppColors.floatingActionButton,
              onPressed: _showDialog,
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
