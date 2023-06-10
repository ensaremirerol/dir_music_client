part of '../playlists_view.dart';

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('playlists').tr(),
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.playlist_add),
              onPressed: () async {
                final Map? result = await showDialog(
                  context: context,
                  builder: (context) {
                    return const _CreatePlaylistDialog();
                  },
                );
                if (result != null) {
                  ref
                      .read(playlistsViewControllerProvider.notifier)
                      .createPlaylist(
                          result['playlistName'], result['isPublic']);
                }
              },
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: ref.watch(playlistsViewControllerProvider).when(data: (data) {
            return data.playlists.isNotEmpty
                ? ListView.builder(
                    itemCount: data.playlists.length,
                    itemBuilder: (context, index) {
                      return PlaylistTile(
                        playlistDetailedModel: data.playlists[index],
                        onTap: () {
                          GoRouter.of(context).push(
                              '/playlists/${data.playlists[index].playlistId}');
                        },
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  // TODO: play playlist
                                },
                                icon: const Icon(Icons.play_arrow)),
                            PopupMenuButton(
                                child: const Icon(Icons.more_vert),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: const Text('delete').tr(),
                                        onTap: () {
                                          ref
                                              .read(
                                                  playlistsViewControllerProvider
                                                      .notifier)
                                              .deletePlaylist(data
                                                  .playlists[index].playlistId);
                                        },
                                      )
                                    ]),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: const Text('no_playlists').tr(),
                  );
          }, error: (error, stackTrace) {
            return const Center(
              child: Icon(Icons.error),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
  }
}
