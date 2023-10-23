import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/pages/add_page.dart';
import 'package:todo_app/providers.dart';
import 'package:todo_app/widgets/my_app_bar.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      appBar: createAppBar('Todos', context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
      ),
      body: _createTodoListView(todoList, context, ref),
    );
  }

  Widget _createTodoListView(List<Todo> todos, BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final todo = todos[index];

        return Slidable(
          key: ValueKey(todo.id),
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: .2,
            children: [
              SlidableAction(
                onPressed: (context) {
                  ref.read(todoListProvider.notifier).removeTodo(todo.id);
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                padding: const EdgeInsets.all(8),
                label: 'Delete',
              ),
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: .2,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  ref.read(todoListProvider.notifier).completeTodo(todo.id);
                },
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.check,
                padding: const EdgeInsets.all(8),
                label: 'Complete',
              ),
            ],
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(todo.content),
          ),
        );
      },
      itemCount: todos.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
