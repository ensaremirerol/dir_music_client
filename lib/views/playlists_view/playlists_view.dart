import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/list_tiles/playlist_tile.dart';
import '../../widgets/responsive_builder/responsive_builder.dart';
import '../../widgets/text_editing_fields/dir_text_form_field.dart';
import 'controllers/playlists_view_controller.dart';
import 'states/playlists_view_state.dart';

part './widgets/body.dart';
part './widgets/create_playlist_dialog.dart';

final playlistsViewControllerProvider = AsyncNotifierProvider.autoDispose<
    PlaylistsViewController, PlaylistsViewState>(
  () => PlaylistsViewController(),
);

class PlaylistsView extends ConsumerWidget {
  const PlaylistsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      playlistsViewControllerProvider,
      (previous, next) {
        next.mapOrNull(
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${error.error}"),
              ),
            );
          },
        );
      },
    );
    return const ResponsiveBuilder(smallScreen: _Body());
  }
}
