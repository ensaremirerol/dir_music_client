import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/instance_controller.dart';
import 'services/auth_service/auth_service.dart';
import 'views/auth_gate/login_view/login_view.dart';
import 'views/auth_gate/register_view/register_view.dart';
import 'views/home_shell_view/home_shell_view.dart';
import 'views/search_view/search_view.dart';

Page _getPageByPlatform(
  Widget child, [
  bool fullscreenDialog = false,
  bool maintainState = true,
]) {
  try {
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
  } catch (e) {
    return MaterialPage(
        child: child,
        fullscreenDialog: fullscreenDialog,
        maintainState: maintainState);
  }
}

final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigator');

// see: https://pub.dev/packages/go_router
final routes = GoRouter(
    navigatorKey: InstanceController().getByKey('RootNavigator'),
    initialLocation: '/',
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
                  _getPageByPlatform(const Center(child: Text('Home')))),
          GoRoute(
              path: '/search',
              pageBuilder: (context, state) =>
                  _getPageByPlatform(const SearchView())),
          GoRoute(
              path: '/profile',
              pageBuilder: (context, state) =>
                  _getPageByPlatform(const Center(child: Text('Profile')))),
        ],
      ),
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
