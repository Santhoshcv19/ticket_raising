import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTheme extends StateNotifier<bool> {
  AppTheme() : super(false);

  set setTheme(bool theme) => state = theme;
}
