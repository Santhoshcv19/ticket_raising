import 'package:flutter/material.dart';
import 'package:ticket_raising_management/core/common/domain/entity/user.entity.dart';
import 'package:ticket_raising_management/core/providers/data/client.provider.dart';
import 'package:ticket_raising_management/core/providers/data/user.provider.dart';
import 'package:ticket_raising_management/core/providers/datetime/datetime.provider.dart';
import 'package:ticket_raising_management/core/providers/locale/locale.provider.dart';
import 'package:ticket_raising_management/core/providers/theme/theme.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<User, List<UserEntity>>(
  (ref) => User(),
);

final clientProvider = StateNotifierProvider<Client, List<UserEntity>>(
  (ref) => Client(),
);

final localeProvider = StateNotifierProvider<Localization, Locale>(
  (ref) => Localization(),
);

final themeProvider = StateNotifierProvider<AppTheme, bool>(
  (ref) => AppTheme(),
);

final dateTimeProvider = StateNotifierProvider<GetDateTime, DateTime>(
  (ref) => GetDateTime(),
);
