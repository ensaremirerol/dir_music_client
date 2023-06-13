import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/instance_controller.dart';
import '../../../services/snackbar_service/snackbar_service.dart';
import '../../../widgets/buttons/dir_primary_button.dart';
import '../../../widgets/responsive_builder/responsive_builder.dart';
import '../../../widgets/text_editing_fields/dir_text_form_field.dart';
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
    ref.listen(
      loginViewControllerProvider.select((value) => value.error),
      (previous, next) {
        InstanceController()
            .getByType<SnackBarService>()
            .showErrorMessage('login_failed'.tr());
      },
    );
    return ResponsiveBuilder(
        smallScreen: Scaffold(
            body: _Body(
      key: key,
    )));
  }
}
