import 'package:flutter/material.dart';
import 'package:tasklist_app/presentation/constants/custom_colors.dart';
import 'package:tasklist_app/presentation/widgets/addtask_alertdialog_widget.dart';
import 'package:tasklist_app/presentation/widgets/task_listview_widget.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Funcion _showDialog
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Builder(
          builder: (context) {
            // Widget AlertDialog
            return const AddTaskAlertDialog();
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
        body: const Column(
          children: [
            SizedBox(
              height: 17,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Hola Ender',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TaskListView(),
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
