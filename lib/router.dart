import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/instance_controller.dart';
import 'services/auth_service/auth_service.dart';
import 'views/auth_gate/login_view/login_view.dart';
import 'views/auth_gate/register_view/register_view.dart';
import 'views/error_view/error_view.dart';
import 'views/home_shell_view/home_shell_view.dart';
import 'views/playlist_view/playlist_view.dart';
import 'views/playlists_view/playlists_view.dart';
import 'views/search_view/search_view.dart';
import 'views/user_profile/user_profile_page.dart';

Page _getPageByPlatform(
  Widget child, [
  bool fullscreenDialog = false,
  bool maintainState = true,
]) {
  if (kIsWeb || Platform.isAndroid)
    return MaterialPage(
        child: child,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState);
  if (Platform.isIOS) {
    return CupertinoPage(
        child: child,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState);
  }
  return MaterialPage(
      child: child,
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState);
}

final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigator');

final GlobalKey<NavigatorState> rootNavigatorKey =
    InstanceController().getByKey('RootNavigator');

// see: https://pub.dev/packages/go_router
final routes = GoRouter(
    navigatorKey: InstanceController().getByKey('RootNavigator'),
    initialLocation: '/',
    errorPageBuilder: (context, state) {
      return _getPageByPlatform(const ErrorView());
    },
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) => _getPageByPlatform(Container()),
          redirect: (context, state) {
            final AuthService? authService =
                InstanceController().getByType<AuthService>();
            if (authService == null) {
              return '/auth/login';
            }
            if (authService.isLoggedIn) {
              return '/home';
            }
            return '/auth/login';
          }),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        pageBuilder: (context, state, child) =>
            _getPageByPlatform(HomeShellView(child: child)),
        routes: [
          GoRoute(
              path: '/home',
              pageBuilder: (context, state) =>
                  _getPageByPlatform(const PlaylistsView())),
          GoRoute(
              path: '/search',
              pageBuilder: (context, state) =>
                  _getPageByPlatform(const SearchView())),
          GoRoute(
              path: '/profile',
              pageBuilder: (context, state) =>
                  _getPageByPlatform(UserProfilePage())),
        ],
      ),
      GoRoute(
          path: '/playlists/:id',
          redirect: (context, state) {
            if (state.pathParameters['id'] == null) {
              return '/home';
            }
            return null;
          },
          pageBuilder: (context, state) {
            final String? id = state.pathParameters['id'];
            return _getPageByPlatform(PlaylistView(
              playlistId: id!,
            ));
          }),
      GoRoute(
        path: '/auth',
        pageBuilder: (context, state) => _getPageByPlatform(Container()),
        redirect: (context, state) {
          final AuthService? authService =
              InstanceController().getByType<AuthService>();
          if (authService != null && authService.isLoggedIn) {
            return '/home';
          }
          return null;
        },
        routes: [
          GoRoute(
              path: 'login',
              pageBuilder: (context, state) =>
                  _getPageByPlatform(const LoginView())),
          GoRoute(
              path: 'register',
              pageBuilder: (context, state) =>
                  _getPageByPlatform(const RegisterView())),
        ],
      )
    ]);
