part of '../playlist_view.dart';

class _Body extends ConsumerWidget {
  const _Body({required this.playlistId});

  final String playlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = ref.watch(playlistProvider(playlistId));
    return playlist.when(
        data: (playlist) {
          return Scaffold(
              body: Container(
            margin: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 100,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      '${playlist.playlistName}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'music_count'.tr(namedArgs: {
                                'count': playlist.songs.length.toString()
                              }),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'playlist_user'
                                  .tr(namedArgs: {'user': playlist.userName}),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  ref
                                      .read(musicControllerProvider.notifier)
                                      .setPlaylist(playlist.songs);
                                },
                                icon: DecoratedBox(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                      border: Border.all(
                                          color: Colors.green, width: 2)),
                                  child: const Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 20)),
                SliverToBoxAdapter(
                    child: Column(
                  children: [
                    Text(
                      'songs',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
                if (playlist.songs.isNotEmpty)
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return MusicTile(
                      music: playlist.songs[index],
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () {
                              ref
                                  .read(playlistProvider(playlistId).notifier)
                                  .removeSong(playlist.songs[index].id);
                            },
                            child: const Text('remove_from_playlist').tr(),
                          ),
                        ],
                        child: const Icon(Icons.more_vert),
                      ),
                    );
                  }, childCount: playlist.songs.length))
                else
                  SliverToBoxAdapter(
                    child: Center(
                      child: const Text('no_songs').tr(),
                    ),
                  )
              ],
            ),
          ));
        },
        error: (error, stackTrace) => const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
