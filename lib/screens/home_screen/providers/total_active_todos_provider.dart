import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/screens/home_screen/providers/todos_provider.dart';

final totalActiveTodosProvider = Provider<int>((ref) {
  return ref.watch(activeTodosProvider).length;
});
