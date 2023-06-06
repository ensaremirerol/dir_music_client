part of '../search_view.dart';

class MusicTile extends ConsumerWidget {
  const MusicTile({super.key, required this.music});

  final MetadataModel music;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.music_note),
        title: Text(music.title),
        subtitle: Text(music.artist),
        trailing: IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () {
            ref.read(musicControllerProvider.notifier).playSong(music);
          },
        ),
      ),
    );
  }
}
