import 'package:flutter/material.dart';
import 'package:tasklist_app/presentation/constants/custom_colors.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        itemCount: 1,
        itemBuilder: (context, index) {
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
                value: false,
                onChanged: (value) {
                  setState(() {
                    value = value!;
                  });
                },
              ),
              contentPadding: const EdgeInsets.only(left: 13),

              // Texto de la tarea
              title: const Text(
                'Hola mundo Flutter ',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textColor,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
