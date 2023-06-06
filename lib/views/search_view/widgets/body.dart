part of '../search_view.dart';

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 16),
        DirTextFormField(
          label: 'search',
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
                    itemCount: data.searchResults.length,
                    itemBuilder: (context, index) {
                      return MusicTile(
                        music: data.searchResults[index],
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
        )
      ]),
    );
  }
}
