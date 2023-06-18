part of '../search_view.dart';

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search').tr(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(height: 16),
          DirTextFormField(
            label: 'search'.tr(),
            onChanged: (value) {
              ref
                  .read(searchViewControllerProvider.notifier)
                  .setSearchQuery(value.trim());
            },
          ),
          Expanded(
            child: ref.watch(searchViewControllerProvider).when(
                  data: (data) {
                    if (data.searchResults.isEmpty &&
                        data.searchQuery.isNotEmpty) {
                      return Center(
                        child: const Text('no_results_found').tr(),
                      );
                    }
                    if (data.searchQuery.isEmpty) {
                      return Center(
                        child: const Text('search_for_songs').tr(),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 16),
                      itemCount: data.searchResults.length,
                      itemBuilder: (context, index) {
                        return MusicTile(
                          music: data.searchResults[index],
                          trailing: PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AddToPlaylistDialog(
                                        songId: data.searchResults[index].id),
                                  );
                                },
                                child: const Text('add_to_playlist').tr(),
                              ),
                            ],
                            child: const Icon(Icons.more_vert),
                          ),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stackTrace) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
          )
        ]),
      ),
    );
  }
}
