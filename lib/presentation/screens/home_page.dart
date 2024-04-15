import 'package:flutter/material.dart';
import 'package:tasklist_app/presentation/constants/custom_colors.dart';
import 'package:tasklist_app/presentation/widgets/task_listview_widget.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Builder(
          builder: (context) {
            // Widget AlertDialog
            return AlertDialog(
              title: const Text('Nueva tarea'),
              content: const SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Escribe Aquí',
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Agregar',
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
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
          // scrolledUnderElevation: 0,
          // toolbarHeight: 80,
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
