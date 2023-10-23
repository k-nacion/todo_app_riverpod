import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/appbar.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screens/home_screen/home_bottom_navigation_bar.dart';
import 'package:todo_app/screens/home_screen/home_floating_action_button.dart';
import 'package:todo_app/screens/home_screen/pages/stats_page.dart';
import 'package:todo_app/screens/home_screen/pages/todo_page.dart';
import 'package:todo_app/screens/home_screen/providers/home_bottom_navigation_bar_index_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    final selectedNavigationIndex = ref.watch(homeBottomNavigationBarIndexProvider);

    return Scaffold(
      appBar: _createAppBar(context, ref),
      floatingActionButton: const HomeFloatingActionButton(),
      bottomNavigationBar: const HomeBottomNavigationBar(),
      body: [
        const TodosPage(),
        const StatsPage(),
      ][selectedNavigationIndex],
    );
  }

  PreferredSizeWidget _createAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('Todos App'),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuEntry<FilterMenu>>[
              const PopupMenuItem(
                value: FilterMenu.showAll,
                child: Text('Show All'),
              ),
              const PopupMenuItem(
                value: FilterMenu.showActive,
                child: Text('Show Active'),
              ),
              const PopupMenuItem(
                value: FilterMenu.showCompleted,
                child: Text('Show Completed'),
              ),
            ];
          },
          icon: const Icon(Icons.filter_list),
        ),
        PopupMenuButton(
          itemBuilder: (context) {
            return <PopupMenuEntry<HomeMenu>>[
              const PopupMenuItem(
                value: HomeMenu.markAllComplete,
                child: Text('Mark all complete'),
              ),
              const PopupMenuItem(
                value: HomeMenu.markAllComplete,
                child: Text('Clear completed'),
              ),
            ];
          },
        )
      ],
    );
  }
}
