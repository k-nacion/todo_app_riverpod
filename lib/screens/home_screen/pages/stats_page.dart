import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/screens/home_screen/providers/total_active_todos_provider.dart';
import 'package:todo_app/screens/home_screen/providers/total_completed_todos_provider.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalCompletedTodos = ref.watch(totalCompletedTodosProvider);
    final totalActiveTodos = ref.watch(totalActiveTodosProvider);

    const verticalSpacing = SizedBox(height: 8);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Completed Todos',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          verticalSpacing,
          Text(
            '$totalCompletedTodos',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          verticalSpacing,
          Text(
            'Active Todos',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          verticalSpacing,
          Text(
            '$totalActiveTodos',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
