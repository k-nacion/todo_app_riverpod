import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/appbar.dart';
import 'package:todo_app/model/todo.dart';
import 'package:uuid/uuid.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super(<Todo>[]);

  void addTodo(String content) => state = [...state, Todo(id: const Uuid().v1(), content: content)];

  void toggleComplete(String id, [bool? value]) => state = [
        for (final Todo todo in state)
          if (todo.id == id) todo.copyWith(isCompleted: value ?? !todo.isCompleted) else todo
      ];

  void removeTodo(String id) => state = state.where((element) => element.id != id).toList();

  List<Todo> getCompletedTodos() => state.where((element) => element.isCompleted == true).toList();

  void toggleAllTodos(HomeMenu homeMenu) {
    switch (homeMenu) {
      case HomeMenu.markAllComplete:
        _toggleAllTodoInternal(true);

      case HomeMenu.clearCompleted:
        _toggleAllTodoInternal(false);
    }
  }

  void _toggleAllTodoInternal(bool value) {
    for (final todo in state) {
      toggleComplete(todo.id, value);
    }
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});
