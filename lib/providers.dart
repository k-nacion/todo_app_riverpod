import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todo.dart';
import 'package:uuid/uuid.dart';

final colorSchemeProvider = Provider<ColorScheme>((ref) {
  return ColorScheme.fromSeed(seedColor: Colors.green);
});

final themeProvider = Provider<ThemeData>((ref) {
  return ThemeData.from(
    colorScheme: ref.watch(colorSchemeProvider),
    useMaterial3: true,
  );
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super(<Todo>[]);

  void addTodo(String content) {
    state = [
      ...state,
      Todo(id: const Uuid().v1(), content: content),
    ];
  }

  void completeTodo(String id) {
    state = [
      for (final Todo todo in state)
        if (todo.id == id) todo.copyWith(isCompleted: true) else todo
    ];
  }

  void removeTodo(String id) {
    state = state.where((element) => element.id != id).toList();
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

/*
final futureTodoListProvider = FutureProvider.autoDispose<List<Todo>>((ref) async {
  return await Future.delayed(
    const Duration(milliseconds: 1350),
    () {
      return ref.watch(todoListProvider);
    },
  );
});
*/
