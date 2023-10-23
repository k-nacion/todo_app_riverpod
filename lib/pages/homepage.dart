import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/model/appbar.dart';
import 'package:todo_app/pages/add_page.dart';
import 'package:todo_app/provider/todo_provider.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      appBar: _createAppBar(context, ref),
      // bottomNavigationBar:,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async =>
            await Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage())),
      ),
      body: _createListView(context, ref),
    );
  }

  PreferredSizeWidget _createAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('Todos App'),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuEntry<FilterMenu>>[
              const PopupMenuItem(
                value: FilterMenu.showAll,
                child: Text('Show All'),
              ),
              const PopupMenuItem(
                value: FilterMenu.showActive,
                child: Text('Show Active'),
              ),
              const PopupMenuItem(
                value: FilterMenu.showCompleted,
                child: Text('Show Completed'),
              ),
            ];
          },
          icon: const Icon(Icons.filter_list),
        ),
        PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuEntry<HomeMenu>>[
              const PopupMenuItem(
                value: HomeMenu.markAllComplete,
                child: Text('Mark all complete'),
              ),
              const PopupMenuItem(
                value: HomeMenu.markAllComplete,
                child: Text('Clear completed'),
              ),
            ];
          },
        )
      ],
    );
  }

  Widget _createListView(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

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
                onPressed: (context) {
                  ref.read(todoListProvider.notifier).removeTodo(todo.id);
                },
                backgroundColor: Colors.red,
                icon: Icons.delete,
              )
            ],
          ),
          child: CheckboxListTile(
            value: todo.isCompleted,
            onChanged: (value) {
              ref.read(todoListProvider.notifier).toggleComplete(todo.id);
            },
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
