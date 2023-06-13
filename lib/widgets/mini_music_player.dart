import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/music_controller/music_controller.dart';
import '../views/music_player/music_player.dart';
import 'cover_art_widget/cover_art_widget.dart';

class MiniMusicPlayer extends ConsumerStatefulWidget {
  const MiniMusicPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MiniMusicPlayerState();
}

class _MiniMusicPlayerState extends ConsumerState<MiniMusicPlayer> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(musicControllerProvider);
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0.0) {
          ref.read(musicControllerProvider.notifier).next();
        } else if (details.primaryVelocity! > 0.0) {
          ref.read(musicControllerProvider.notifier).previous();
        }
      },
      child: Card(
        child: ListTile(
          leading: SizedBox(
            height: 50,
            width: 50,
            child:  state.currentSong != null
                ? CoverArtWidget(
                    id: state.currentSong!.id,
                  )
                : const CoverArtWidget.notPlaying(
                    errorSize: 50,
                  ),
          ),
          title: Text(state.currentSong?.title ?? 'no_song_playing'.tr()),
          subtitle: Text(state.currentSong?.artist ?? ''),
          onTap: () {
            showModalBottomSheet(
              useRootNavigator: true,
              useSafeArea: true,
              isScrollControlled: true,
              barrierColor: Colors.transparent,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              context: context,
              builder: (context) => const MusicPlayer(),
            );
          },
          trailing: state.isPlaying
              ? IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    ref.read(musicControllerProvider.notifier).pause();
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    ref.read(musicControllerProvider.notifier).play();
                  },
                ),
        ),
      ),
    );
  }
}
