import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/buttons/dir_primary_button.dart';
import '../../widgets/responsive_builder/responsive_builder.dart';
import '../../widgets/text_editing_fields/dir_text_form_field.dart';
import 'controllers/login_view_controller.dart';
import 'states/login_view_state.dart';

part './widgets/body.dart';

final loginViewControllerProvider =
    AsyncNotifierProvider<LoginViewController, LoginViewState>(
  () => LoginViewController(),
);

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(smallScreen: Scaffold(body: _Body()));
  }
}
