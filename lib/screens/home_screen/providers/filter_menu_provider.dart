import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/appbar.dart';

final filterMenuProvider = StateProvider<FilterMenu>((ref) {
  return FilterMenu.showAll;
});
