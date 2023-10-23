import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todo.dart';
import 'package:uuid/uuid.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super(<Todo>[]);

  void addTodo(String content) => state = [...state, Todo(id: const Uuid().v1(), content: content)];

  void toggleComplete(String id) => state = [
        for (final Todo todo in state)
          if (todo.id == id) todo.copyWith(isCompleted: !todo.isCompleted) else todo
      ];

  void removeTodo(String id) => state = state.where((element) => element.id != id).toList();

  List<Todo> getCompletedTodos() => state.where((element) => element.isCompleted == true).toList();
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});
