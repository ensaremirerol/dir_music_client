import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/instance_controller.dart';
import '../../services/snackbar_service/snackbar_service.dart';
import '../../widgets/list_tiles/playlist_tile.dart';
import 'controllers/add_to_playlist_dialog_controller.dart';
import 'states/add_to_playlist_dialog_state.dart';

part 'widgets/body.dart';

final addToPlaylistDialogProvider = AutoDisposeAsyncNotifierProviderFamily<
    AddToPlaylistDialogController, AddToPlaylistDialogState, int>(
  () => AddToPlaylistDialogController(),
);

class AddToPlaylistDialog extends ConsumerWidget {
  const AddToPlaylistDialog({super.key, required this.songId});

  final int songId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      addToPlaylistDialogProvider(songId),
      (previous, next) {
        next.mapOrNull(
          data: (data) {
            if (data.requireValue.isAdded) {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: _Body(
        key: key,
        songId: songId,
      ),
    );
  }
}
