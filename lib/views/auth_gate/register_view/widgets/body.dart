part of '../register_view.dart';

class _Body extends ConsumerStatefulWidget {
  _Body({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  ConsumerState<_Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      registerViewControllerProvider,
      (previous, next) {
        if (next.hasValue && next.requireValue.message == 'register_success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.requireValue.message),
            ),
          );
          context.go('auth/login');
        }
      },
    );
    return Form(
        key: widget._formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('register_dir',
                    style: Theme.of(context).textTheme.displayMedium)
                .tr(),
            const SizedBox(height: 20),
            Card(
              elevation: 8,
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DirTextFormField(
                      label: 'username',
                      hint: 'username',
                      prefixIcon: const Icon(Icons.person),
                      onChanged: (value) {
                        ref
                            .read(registerViewControllerProvider.notifier)
                            .setUsername(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'username_cannot_be_empty'.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DirTextFormField(
                      label: 'phone_number',
                      hint: 'phone_number',
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      prefixIcon: const Icon(Icons.phone),
                      onChanged: (value) {
                        ref
                            .read(registerViewControllerProvider.notifier)
                            .setPhoneNumber(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'phone_number_cannot_be_empty'.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DirTextFormField(
                      label: 'date_of_birth',
                      hint: 'date_of_birth',
                      controller: _dateController,
                      prefixIcon: const Icon(Icons.calendar_today),
                      onTap: () async {
                        final DateTime? result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (result != null) {
                          _dateController.text =
                              DateFormat('yyyy-MM-dd').format(result);
                          ref
                              .read(registerViewControllerProvider.notifier)
                              .setBirthDate(result);
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    DirTextFormField(
                      label: 'password',
                      hint: 'password',
                      obscureText: true,
                      prefixIcon: const Icon(Icons.lock),
                      controller: _passwordController,
                      onChanged: (value) {
                        ref
                            .read(registerViewControllerProvider.notifier)
                            .setPassword(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password_cannot_be_empty'.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DirTextFormField(
                      label: 'confirm_password',
                      hint: 'confirm_password',
                      obscureText: true,
                      prefixIcon: const Icon(Icons.lock),
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'confirm_password_cannot_be_empty'.tr();
                        }
                        if (value != _passwordController.text) {
                          return 'confirm_password_not_match'.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (widget._formKey.currentState!.validate()) {
                          ref
                              .read(registerViewControllerProvider.notifier)
                              .register();
                        }
                      },
                      child: const Text('register').tr(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
