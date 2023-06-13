import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/music_controller/music_controller.dart';
import '../../models/metadata/metadata_model.dart';

class MusicTile extends ConsumerWidget {
  const MusicTile({super.key, required this.music, this.trailing, this.onTap});

  final MetadataModel music;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
          leading: const Icon(Icons.music_note),
          title: Text(music.title),
          subtitle: Text(music.artist),
          onTap: onTap ??
              () {
                ref.read(musicControllerProvider.notifier).playSong(music);
              },
          trailing: trailing),
    );
  }
}
