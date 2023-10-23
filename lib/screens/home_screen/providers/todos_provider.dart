import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/appbar.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todo_provider.dart';

final allTodosProvider = Provider<List<Todo>>((ref) {
  return ref.watch(todoListProvider);
});

final activeTodosProvider = Provider<List<Todo>>((ref) {
  final activeTodos = <Todo>[];

  for (final todo in ref.watch(todoListProvider)) {
    if (!todo.isCompleted) {
      activeTodos.add(todo);
    }
  }

  return activeTodos;
});

final completedTodosProvider = Provider<List<Todo>>((ref) {
  final completedTodos = <Todo>[];

  for (final todo in ref.watch(todoListProvider)) {
    if (todo.isCompleted) {
      completedTodos.add(todo);
    }
  }

  return completedTodos;
});

final dynamicTodosProvider = Provider.family<List<Todo>, FilterMenu>((ref, filterMenu) {
  return switch (filterMenu) {
    FilterMenu.showAll => ref.watch(allTodosProvider),
    FilterMenu.showActive => ref.watch(activeTodosProvider),
    FilterMenu.showCompleted => ref.watch(completedTodosProvider),
  };
});
