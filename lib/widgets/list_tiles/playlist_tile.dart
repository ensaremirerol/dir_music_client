import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../models/playlists/playlist_detailed_model/playlist_detailed_model.dart';

class PlaylistTile extends ConsumerWidget {
  const PlaylistTile(
      {super.key,
      required this.playlistDetailedModel,
      this.trailing,
      this.onTap});

  final PlaylistDetailedModel playlistDetailedModel;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
          leading: const Icon(Icons.music_note),
          title: Text(playlistDetailedModel.playlistName),
          subtitle: Text('music_count').tr(namedArgs: {
            'count': playlistDetailedModel.songs.length.toString()
          }),
          onTap: onTap,
          trailing: trailing),
    );
  }
}
