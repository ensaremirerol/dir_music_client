part of '../home_shell_view.dart';

class _MiniMusicPlayer extends ConsumerStatefulWidget {
  const _MiniMusicPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __MiniMusicPlayerState();
}

class __MiniMusicPlayerState extends ConsumerState<_MiniMusicPlayer> {
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
          leading: const Hero(tag: 'album-art', child: const Icon(Icons.album)),
          title: Text(state.currentSong?.title ?? 'no_song_playing'.tr()),
          subtitle: Text(state.currentSong?.artist ?? ''),
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
