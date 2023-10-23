import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/screens/home_screen/app_bar/home_app_bar.dart';
import 'package:todo_app/screens/home_screen/home_bottom_navigation_bar.dart';
import 'package:todo_app/screens/home_screen/home_floating_action_button.dart';
import 'package:todo_app/screens/home_screen/pages/stats_page.dart';
import 'package:todo_app/screens/home_screen/pages/todo_page.dart';
import 'package:todo_app/screens/home_screen/providers/home_bottom_navigation_bar_index_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNavigationIndex = ref.watch(homeBottomNavigationBarIndexProvider);

    return Scaffold(
      appBar: const HomeAppBar(
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      floatingActionButton: const HomeFloatingActionButton(),
      bottomNavigationBar: const HomeBottomNavigationBar(),
      body: [
        const TodosPage(),
        const StatsPage(),
      ][selectedNavigationIndex],
    );
  }
}
