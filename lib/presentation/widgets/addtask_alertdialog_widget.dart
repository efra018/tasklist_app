import 'package:flutter/material.dart';

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
  }
}
