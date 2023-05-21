import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/api_service/api_service.dart';
import 'core/services/global_navigator/global_navigator.dart';
import 'core/services/setup_service/setup_service.dart';
import 'services/snackbar_service/snackbar_service.dart';
import 'core/utils/instance_controller.dart';
import 'services/auth_service/auth_service.dart';

final setupTasks = [
  SetupTask(
      name: 'Logger',
      dependencies: [],
      task: () => InstanceController().addInstance(Logger, Logger())),
  SetupTask(
      name: 'EasyLocalization',
      dependencies: [],
      task: () async {
        await EasyLocalization.ensureInitialized();
      }),
  SetupTask(
      name: 'SharedPreferences',
      dependencies: [],
      task: () async {
        InstanceController().addInstance(
            SharedPreferences, await SharedPreferences.getInstance());
      }),
  SetupTask(
      name: 'GlobalKeys',
      dependencies: [],
      task: () {
        InstanceController().addInstance('RootNavigator',
            GlobalKey<NavigatorState>(debugLabel: 'RootNavigator'));

        InstanceController().addInstance('AppScaffold',
            GlobalKey<ScaffoldMessengerState>(debugLabel: 'AppScaffold'));
      }),
  SetupTask(
    name: 'SnackbarService',
    dependencies: ['GlobalKeys'],
    task: () {
      final snackbarService = SnackBarService(InstanceController()
          .getByKey<GlobalKey<ScaffoldMessengerState>>('AppScaffold'));
      InstanceController().addInstance(SnackBarService, snackbarService);
    },
  ),
  SetupTask(
      name: 'GlobalNavigator',
      dependencies: ['Logger', 'GlobalKeys'],
      task: () {
        final globalNavigator = GlobalNavigator(InstanceController()
            .getByKey<GlobalKey<NavigatorState>>('RootNavigator'));
        InstanceController().addInstance(GlobalNavigator, globalNavigator);
      }),
  SetupTask(
      name: 'ApiService',
      dependencies: ['Logger'],
      task: () {
        final apiService = ApiService(
          baseUrl: 'http://localhost:8080',
        );
        apiService.init();
        InstanceController().addInstance(
          ApiService,
          apiService,
        );
      }),
  SetupTask(
    name: 'ThemeService',
    dependencies: [],
    task: () async {
      final themeStr = await rootBundle.loadString('assets/other/theme.json');
      final themeJson = jsonDecode(themeStr);
      final theme = ThemeDecoder.decodeThemeData(themeJson);
      InstanceController().addInstance(ThemeData, theme!);
    },
  ),
  SetupTask(
      name: 'AuthService',
      dependencies: ['Logger', 'SharedPreferences', 'ApiService'],
      task: () {
        final authService = AuthService();
        authService.init();
        InstanceController().addInstance(AuthService, authService);
      }),
];
