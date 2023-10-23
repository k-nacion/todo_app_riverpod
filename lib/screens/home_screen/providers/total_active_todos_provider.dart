import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';

final totalActiveTodosProvider = Provider<int>((ref) {
  int totalActiveTodos = 0;
  for (final todo in ref.watch(todoListProvider)) {
    if (!todo.isCompleted) {
      totalActiveTodos++;
    }
  }

  return totalActiveTodos;
});
