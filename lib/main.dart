import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/setup_service/setup_service.dart';
import 'core/utils/instance_controller.dart';
import 'router.dart';
import 'setup.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setPrefix('dir_');
  final setupService = SetupService();
  setupService.registerAllTasks(setupTasks);
  await setupService.setup();

  runApp(ProviderScope(
    child: EasyLocalization(
      child: const App(),
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
    ),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
        scaffoldMessengerKey: InstanceController()
            .getByKey<GlobalKey<ScaffoldMessengerState>>('AppScaffold'),
        routerConfig: routes,
        title: 'Dir Music',
        themeMode: ThemeMode.dark,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        theme: ThemeData(
            primarySwatch: Colors.teal,
            brightness: Brightness.dark,
            useMaterial3: true));
  }
}
