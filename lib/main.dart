import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/services/setup_service/setup_service.dart';
import 'router.dart';
import 'setup.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
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
      routerConfig: routes,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return child!;
      },
    );
  }
}
