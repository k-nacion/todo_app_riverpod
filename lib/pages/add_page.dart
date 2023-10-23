import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers.dart';
import 'package:todo_app/widgets/my_app_bar.dart';

class AddPage extends ConsumerWidget {
  AddPage({super.key});

  final todoEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: createAppBar('Add Todo', context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  labelText: 'Todo',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                controller: todoEditingController,
              ),
              FilledButton.tonal(
                  onPressed: () {
                    ref.read(todoListProvider.notifier).addTodo(todoEditingController.value.text);

                    Navigator.pop(context);
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
