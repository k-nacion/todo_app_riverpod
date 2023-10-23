import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';

final totalCompletedTodosProvider = Provider<int>((ref) {
  int totalCompletedTodos = 0;
  for (final todo in ref.watch(todoListProvider)) {
    if (todo.isCompleted) {
      totalCompletedTodos++;
    }
  }

  return totalCompletedTodos;
});
