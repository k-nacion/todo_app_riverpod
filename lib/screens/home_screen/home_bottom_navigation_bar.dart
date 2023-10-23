import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/screens/home_screen/providers/home_bottom_navigation_bar_index_provider.dart';

class HomeBottomNavigationBar extends ConsumerWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(homeBottomNavigationBarIndexProvider);
    final selectedIndexController = ref.watch(homeBottomNavigationBarIndexProvider.notifier);

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        selectedIndexController.state = value;
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.list), label: 'Todos'),
        NavigationDestination(icon: Icon(Icons.show_chart), label: 'Stats'),
      ],
    );
  }
}
