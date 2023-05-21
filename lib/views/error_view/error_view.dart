import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/buttons/dir_primary_button.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('error_route_not_found').tr(),
            DirPrimaryButton(
                label: const Text('go_home').tr(),
                onPressed: () {
                  context.go('/');
                })
          ],
        ),
      ),
    );
  }
}
