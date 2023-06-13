part of '../music_player.dart';

class PlaylistValues {
  final MetadataModel? currentSong;
  final List<MetadataModel>? playlist;
  final int? index;

  const PlaylistValues({this.currentSong, this.playlist, this.index});

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistValues &&
          runtimeType == other.runtimeType &&
          currentSong == other.currentSong &&
          playlist == other.playlist;

  @override
  int get hashCode => currentSong.hashCode ^ playlist.hashCode;
}

class _PlaylistTab extends ConsumerWidget {
  const _PlaylistTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch(musicControllerProvider.select((value) => PlaylistValues(
              currentSong: value.currentSong,
              playlist: value.playlist,
              index: value.currentIndex,
            )));
    return Scaffold(
        appBar: AppBar(
            title: const Text('playlist').tr(),
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, size: 40),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'currently_playing',
                style: Theme.of(context).textTheme.titleLarge,
              ).tr(),
              state.currentSong != null
                  ? MusicTile(music: state.currentSong!)
                  : const Text('no_song_playing').tr(),
              const Divider(
                height: 50,
                thickness: 2,
              ),
              Text(
                'next_songs',
                style: Theme.of(context).textTheme.titleLarge,
              ).tr(),
              Expanded(
                  child: (state.playlist?.isNotEmpty ?? false)
                      ? ListView.builder(
                          itemCount: state.playlist!.length - state.index! - 1,
                          itemBuilder: (context, index) {
                            final music =
                                state.playlist![index + state.index! + 1];
                            return MusicTile(
                                music: music,
                                onTap: () {
                                  ref
                                      .read(musicControllerProvider.notifier)
                                      .skipTo(index + state.index! + 1);
                                },
                                trailing: IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    ref
                                        .read(musicControllerProvider.notifier)
                                        .removeSong(index + state.index! + 1);
                                  },
                                ));
                          },
                        )
                      : Center(child: const Text('no_songs_in_playlist').tr())),
            ],
          ),
        ));
  }
}
