import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/playlists/playlist_detailed_model/playlist_detailed_model.dart';
import '../../widgets/list_tiles/music_tile.dart';
import '../../widgets/responsive_builder/responsive_builder.dart';
import 'controllers/playlist_view_controller.dart';

part 'widgets/body.dart';

final playlistProvider = AutoDisposeAsyncNotifierProviderFamily<
    PlaylistNotifier, PlaylistDetailedModel, String>(() => PlaylistNotifier());

class PlaylistView extends ConsumerWidget {
  const PlaylistView({super.key, required this.playlistId});

  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(
        smallScreen: _Body(
      playlistId: playlistId,
    ));
  }
}
