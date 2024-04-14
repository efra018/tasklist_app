import 'package:flutter/material.dart';
import 'package:tasklist_app/presentation/constants/custom_colors.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 2,
          scrolledUnderElevation: 0,
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
            )
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: AppColors.floatingActionButton,
              onPressed: () {},
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
