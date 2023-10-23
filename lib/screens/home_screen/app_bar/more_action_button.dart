import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/appbar.dart';
import 'package:todo_app/provider/todo_provider.dart';

class MoreActionButton extends ConsumerWidget {
  const MoreActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todolistController = ref.watch(todoListProvider.notifier);
    final todolist = ref.watch(todoListProvider);

//TODO: move this logic to its own provider. Separate the logic business to presentation.
    return PopupMenuButton(
      onSelected: (value) {
        switch (value) {
          case HomeMenu.markAllComplete:
            {
              for (final todo in todolist) {
                todolistController.toggleComplete(todo.id, true);
              }
            }
          case HomeMenu.clearCompleted:
            {
              for (final todo in todolist) {
                todolistController.toggleComplete(todo.id, false);
              }
            }
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<HomeMenu>>[
          const PopupMenuItem(
            value: HomeMenu.markAllComplete,
            child: Text('Mark all complete'),
          ),
          const PopupMenuItem(
            value: HomeMenu.clearCompleted,
            child: Text('Clear completed'),
          ),
        ];
      },
    );
  }
}
