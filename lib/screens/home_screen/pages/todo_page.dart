import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screens/home_screen/providers/filter_menu_provider.dart';
import 'package:todo_app/screens/home_screen/providers/todos_provider.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterMenu = ref.watch(filterMenuProvider);
    final todos = ref.watch(dynamicTodosProvider(filterMenu));

    const separatorBuilder = SizedBox(
        height: 4,
        child: Center(
          child: Divider(),
        ));

    return ListView.separated(
      itemBuilder: (context, index) {
        final todo = todos[index];

        return Slidable(
          key: ValueKey(todo.id),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: .2,
            children: [
              SlidableAction(
                onPressed: (context) => ref.read(todoListProvider.notifier).removeTodo(todo.id),
                backgroundColor: Colors.red,
                icon: Icons.delete,
              )
            ],
          ),
          child: CheckboxListTile(
            value: todo.isCompleted,
            onChanged: (value) => ref.read(todoListProvider.notifier).toggleComplete(todo.id),
            title: Text(
              todo.content,
              style:
                  todo.isCompleted ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => separatorBuilder,
      itemCount: todos.length,
    );
  }
}
