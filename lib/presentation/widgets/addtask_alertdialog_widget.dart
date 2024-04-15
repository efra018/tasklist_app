import 'package:flutter/material.dart';
import 'package:tasklist_app/presentation/constants/custom_colors.dart';

void main() => runApp(const AddTaskAlertDialog());

class AddTaskAlertDialog extends StatefulWidget {
  const AddTaskAlertDialog({super.key});

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.alertColor,
      title: const Text('Nueva tarea'),
      content: Theme(
        // Aquí se define el tema del TextField
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.orange.shade800,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.orange.shade900,
              ),
            ),
          ),
        ),
        child: const TextField(
          // cursorColor: Colors.orange.shade900,
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
            style: TextStyle(color: Colors.orange[900], fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Agregar',
            style: TextStyle(color: Colors.orange[900], fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
