import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/screens/home_screen/providers/todos_provider.dart';

final totalCompletedTodosProvider = Provider<int>((ref) {
  return ref.watch(completedTodosProvider).length;
});
