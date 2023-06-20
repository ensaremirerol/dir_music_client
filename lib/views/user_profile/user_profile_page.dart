import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/buttons/dir_primary_button.dart';
import '../../widgets/info_card/user_info_card.dart';
import 'states/user_view_state.dart';
import 'user_profile_controller.dart';

final userProfileProvider =
    AsyncNotifierProvider.autoDispose<UserProfileController, UserViewState>(
  () => UserProfileController(),
);

class UserProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userProfileProvider).when(data: (data) {
      return _buildBody(context, ref, data);
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    }, error: (error, stack) {
      return Center(child: Text('Error: $error'));
    });
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, UserViewState data) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            Text(
              data.userName,
              style:
                  const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20, width: 200, child: Divider()),
            InfoCard(
              text: data.phoneNumber?.toString() ?? 'No phone number',
              icon: Icons.phone,
            ),
            InfoCard(
              text: data.followerCount?.toString() ?? 'No followers',
              icon: Icons.group,
            ),
            DirPrimaryButton(
                label: const Text('LOGOUT'),
                onPressed: () =>
                    ref.read(userProfileProvider.notifier).logout()),
          ]),
        ));
  }
}
