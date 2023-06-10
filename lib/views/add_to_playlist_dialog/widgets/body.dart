part of '../add_to_playlist_dialog.dart';

class _Body extends ConsumerWidget {
  const _Body({super.key, required this.songId});
  final int songId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addToPlaylistDialogProvider(songId));
    return Scaffold(
      appBar: AppBar(
        title: Text('add_to_playlist').tr(),
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Text(
            'select_playlist',
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: state.when(
                data: (data) => data.playlists.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.all(16),
                        shrinkWrap: true,
                        itemCount: data.playlists.length,
                        itemBuilder: (context, index) {
                          return PlaylistTile(
                            playlistDetailedModel: data.playlists[index],
                            trailing: data.playlists[index].songs
                                    .where((element) => element.id == songId)
                                    .isNotEmpty
                                ? const Icon(Icons.check)
                                : null,
                            onTap: () async {
                              final result = await ref
                                  .read(addToPlaylistDialogProvider(songId)
                                      .notifier)
                                  .addSongToPlaylist(
                                      data.playlists[index].playlistId);
                              if (result.startsWith('error')) {
                                InstanceController()
                                    .getByType<SnackBarService>()
                                    .showErrorMessage(result.tr());
                              } else {
                                InstanceController()
                                    .getByType<SnackBarService>()
                                    .showSuccessMessage(result.tr());
                              }
                            },
                          );
                        })
                    : const Center(child: Text('no_playlists')),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text(error.toString()))),
          ),
        ],
      ),
    );
  }
}
