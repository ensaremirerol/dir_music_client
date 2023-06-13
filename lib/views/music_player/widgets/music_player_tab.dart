part of '../music_player.dart';

class _MusicPlayerTab extends ConsumerWidget {
  const _MusicPlayerTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(musicControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        state.isPlaying && state.currentSong != null
            ? CoverArtWidget(
                id: state.currentSong!.id,
              )
            : const CoverArtWidget.notPlaying(
                errorSize: 250,
              ),
        const Divider(
          height: 50,
          indent: 50,
          endIndent: 50,
          thickness: 2,
        ),
        const _Data(),
        // const _Controls(),
      ],
    );
  }
}
