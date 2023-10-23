import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen/app_bar/filter_action_button.dart';
import 'package:todo_app/screens/home_screen/app_bar/more_action_button.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required Size preferredSize,
  }) : _preferredSize = preferredSize;

  final Size _preferredSize;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => _preferredSize;
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Todos App'),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: const [
        FilterActionButton(),
        MoreActionButton(),
      ],
    );
  }
}
