import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/appbar.dart';
import 'package:todo_app/screens/home_screen/providers/filter_menu_provider.dart';

class FilterActionButton extends ConsumerWidget {
  const FilterActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chosenFilterController = ref.watch(filterMenuProvider.notifier);

    return PopupMenuButton(
      onSelected: (value) => chosenFilterController.state = value,
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
    );
  }
}
