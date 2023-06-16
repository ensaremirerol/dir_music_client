import 'dart:convert';

import 'package:audio_session/audio_session.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/api_service/api_service.dart';
import 'core/services/global_navigator/global_navigator.dart';
import 'core/services/setup_service/setup_service.dart';
import 'models/authentication/refresh_model/refresh_model.dart';
import 'services/api_service/calls/authentication/refresh_token_api_call.dart';
import 'services/cover_art_service/cover_art_service.dart';
import 'services/metadata_service/metadata_service.dart';
import 'services/playlist_service/playlist_service.dart';
import 'services/snackbar_service/snackbar_service.dart';
import 'core/utils/instance_controller.dart';
import 'services/auth_service/auth_service.dart';
import 'services/user_service/user_service.dart';

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
          baseUrl: const String.fromEnvironment('API_URL',
              defaultValue: 'http://localhost:8080'),
          refreshBearerToken: (apiService) async {
            apiService.bearerToken = null;
            try {
              final ResponseObject<RefreshModel> response =
                  (await apiService.call(
                const RefreshTokenApiCall(),
                RefreshTokenApiCallArgs(
                  refreshToken: InstanceController()
                      .getByType<AuthService>()
                      .refreshToken!,
                ),
              )) as ResponseObject<RefreshModel>;

              if (response.statusCode ~/ 100 == 2) {
                return response.data!.accessToken;
              }
              return null;
            } catch (e) {
              Logger().e(e);
              return null;
            }
          },
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
      dependencies: [
        'Logger',
        'SharedPreferences',
        'ApiService',
        'UserService'
      ],
      task: () {
        final authService = AuthService();
        authService.init();
        InstanceController().addInstance(AuthService, authService);
      }),
  SetupTask(
    name: 'UserService',
    dependencies: ['Logger', 'ApiService'],
    task: () {
      InstanceController().addInstance(UserService, UserService());
    },
  ),
  SetupTask(
      name: 'MetadataService',
      dependencies: ['Logger', 'ApiService'],
      task: () {
        InstanceController().addInstance(MetadataService, MetadataService());
      }),
  SetupTask(
      name: 'PlaylistService',
      dependencies: ['Logger', 'ApiService'],
      task: () {
        InstanceController().addInstance(PlaylistService, PlaylistService());
      }),
  SetupTask(
    name: 'CoverArtService',
    dependencies: ['Logger', 'ApiService'],
    task: () {
      InstanceController().addInstance(CoverArtService, CoverArtService());
    },
  ),
  SetupTask(
    name: 'AudioType',
    dependencies: [],
    task: () async {
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.music());
      InstanceController().addInstance(AudioSession, session);
    },
  ),
  SetupTask(
      name: 'AudioPlayer',
      dependencies: ['AudioType'],
      task: () {
        InstanceController().addInstance(AudioPlayer, AudioPlayer());
      }),
];
