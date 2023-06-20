import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/music_controller/music_controller.dart';
import '../../models/metadata/metadata_model.dart';
import '../cover_art_widget/cover_art_widget.dart';

class MusicTile extends ConsumerWidget {
  const MusicTile({super.key, required this.music, this.trailing, this.onTap});

  final MetadataModel music;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
          enabled: music.listenable,
          leading: SizedBox(
              height: 50,
              width: 50,
              child: CoverArtWidget(id: music.id, errorSize: 50)),
          title: Text(music.title),
          subtitle: Text(music.artist),
          onTap: onTap != null && music.listenable
              ? () {
                  ref.read(musicControllerProvider.notifier).playSong(music);
                }
              : null,
          trailing: trailing),
    );
  }
}
