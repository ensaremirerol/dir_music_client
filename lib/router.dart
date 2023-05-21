import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/instance_controller.dart';
import 'services/auth_service/auth_service.dart';
import 'views/login_view/login_view.dart';

Page _getPageByPlatform(
  Widget child, [
  bool fullscreenDialog = false,
  bool maintainState = true,
]) {
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
              return '/login';
            }
            if (authService.isLoggedIn) {
              return '/home';
            }
            return '/login';
          },
          routes: [
            GoRoute(
                path: 'login',
                pageBuilder: (context, state) =>
                    _getPageByPlatform(const LoginView())),
            GoRoute(
                path: 'home',
                pageBuilder: (context, state) => _getPageByPlatform(
                      Container(
                        child: const Center(
                          child: Text('Home'),
                        ),
                      ),
                    )),
          ]),
    ]);
