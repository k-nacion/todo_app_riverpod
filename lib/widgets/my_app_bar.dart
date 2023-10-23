import 'package:flutter/material.dart';

PreferredSizeWidget createAppBar(String title, BuildContext context) => AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
