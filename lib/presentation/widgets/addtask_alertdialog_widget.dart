import 'package:flutter/material.dart';
import 'package:tasklist_app/presentation/constants/custom_colors.dart';

class AddTaskAlertDialog extends StatefulWidget {
  const AddTaskAlertDialog({super.key, required this.onTaskAdded});

  // Variable onTaskAdded de tipo Function(String)
  // debe ser una funcion que toma como argumento un tipo String
  final Function(String) onTaskAdded;

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  // captando valor de TextField con TextEditingController.
  final TextEditingController _taskInputController = TextEditingController();

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
        child: TextField(
          controller: _taskInputController,
          decoration: const InputDecoration(
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
            // Obteniendo el valor ingresado del texto pasando como parametro a onTaskAdded
            widget.onTaskAdded(_taskInputController.text);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
