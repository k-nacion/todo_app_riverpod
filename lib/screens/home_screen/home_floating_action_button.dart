import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_page.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async =>
          await Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage())),
    );
  }
}
