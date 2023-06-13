import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/music_controller/music_controller.dart';
import '../../models/metadata/metadata_model.dart';
import '../../widgets/list_tiles/music_tile.dart';
import '../../widgets/responsive_builder/responsive_builder.dart';
import '../add_to_playlist_dialog/add_to_playlist_dialog.dart';
import 'controllers/music_player_controller.dart';
import 'states/position_state.dart';

part 'widgets/body.dart';
part 'widgets/music_player_tab.dart';
part 'widgets/playlist_tab.dart';
part 'widgets/cover_art.dart';
part 'widgets/data.dart';

final musicPlayerProvider =
    NotifierProvider<MusicPlayerController, PositionState>(
  () => MusicPlayerController(),
);

class MusicPlayer extends ConsumerWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveBuilder(
        smallScreen: _Body(
      key: key,
    ));
  }
}
