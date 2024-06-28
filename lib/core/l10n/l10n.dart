import 'package:flutter/material.dart';

class L10n {
  static final all = [const Locale('en')];

  static String getCode(String code) {
    switch (code) {
      case 'en':
        return 'English';
      default:
        return 'English';
    }
  }
}
