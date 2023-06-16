part of '../music_player.dart';

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MetadataModel? state =
        ref.watch(musicControllerProvider.select((value) => value.currentSong));
    return Scaffold(
        appBar: AppBar(
            title: const Text('music_player').tr(),
            actions: [
              IconButton(
                icon: const Icon(Icons.queue_music_sharp, size: 30),
                onPressed: () {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    useSafeArea: true,
                    isScrollControlled: true,
                    barrierColor: Theme.of(context).scaffoldBackgroundColor,
                    context: context,
                    builder: (context) => const _PlaylistTab(),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.playlist_add, size: 30),
                onPressed: state != null
                    ? () {
                        showDialog(
                            context: context,
                            builder: (context) => AddToPlaylistDialog(
                                  songId: state.id,
                                ));
                      }
                    : null,
              )
            ],
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, size: 40),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: const _MusicPlayerTab());
  }
}
