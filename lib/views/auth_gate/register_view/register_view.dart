import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/responsive_builder/responsive_builder.dart';
import '../../../widgets/text_editing_fields/dir_text_form_field.dart';
import 'controllers/register_view_controller.dart';
import 'states/register_view_state.dart';

part 'widgets/body.dart';

final registerViewControllerProvider = AsyncNotifierProvider.autoDispose<
    RegisterViewController, RegisterViewState>(
  () => RegisterViewController(),
);

class RegisterView extends ConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(
        smallScreen: Scaffold(
            body: _Body(
      key: key,
    )));
  }
}
