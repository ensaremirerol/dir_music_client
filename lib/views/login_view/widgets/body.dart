part of '../login_view.dart';

class _Body extends ConsumerWidget {
  _Body({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('login_dir', style: Theme.of(context).textTheme.displayMedium)
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
                  const SizedBox(height: 20),
                  DirTextFormField(
                    label: 'username',
                    hint: 'username',
                    prefixIcon: const Icon(Icons.person),
                    onChanged: (value) {
                      ref
                          .read(loginViewControllerProvider.notifier)
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
                    label: 'password',
                    hint: 'password',
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock),
                    onChanged: (value) {
                      ref
                          .read(loginViewControllerProvider.notifier)
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
                  DirPrimaryButton(
                    label: const Text('login').tr(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref.read(loginViewControllerProvider.notifier).login();
                      }
                    },
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                  ),
                  DirPrimaryButton(
                    label: const Text('register').tr(),
                    onPressed: () {
                      log('Register');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
