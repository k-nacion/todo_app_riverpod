import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorSchemeProvider = Provider<ColorScheme>((ref) {
  return ColorScheme.fromSeed(seedColor: Colors.pink);
});

final themeProvider = Provider<ThemeData>((ref) {
  return ThemeData.from(
    colorScheme: ref.watch(colorSchemeProvider),
    useMaterial3: true,
  );
});
