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
      return _buildBody(data, ref);
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    }, error: (error, stack) {
      return Center(child: Text('Error: $error'));
    });
  }

  Widget _buildBody(UserViewState data, WidgetRef ref) {
    return SafeArea(
        child: Column(children: <Widget>[
      const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/images/avatar.png'),
      ),
      Text(
        data.userName,
        style: const TextStyle(
            fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
        width: 200,
        child: Divider(color: Colors.white),
      ),
      InfoCard(
          text: data.phoneNumber?.toString() ?? 'No phone number',
          icon: Icons.phone,
          onPressed: () => ref
              .read(userProfileProvider.notifier)
              .logout()), //TODO: change to phone number
      InfoCard(
          text: data.dateOfBirth?.toString() ?? 'No date of birth',
          icon: Icons.calendar_today,
          onPressed: () => ref
              .read(userProfileProvider.notifier)
              .logout()), //TODO: change to date of birth
      InfoCard(
          text: data.followerCount?.toString() ?? 'No followers',
          icon: Icons.group,
          onPressed: () => ref
              .read(userProfileProvider.notifier)
              .logout()), //TODO: change to followers
      ElevatedButton(
        onPressed: () {}, // TODO: implement delete account
        child: const Text(
          'DELETE ACCOUNT',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
      ),
      const Spacer(),
      DirPrimaryButton(
          label: const Text('LOGOUT'),
          onPressed: () => ref.read(userProfileProvider.notifier).logout()),
    ]));
  }
}
