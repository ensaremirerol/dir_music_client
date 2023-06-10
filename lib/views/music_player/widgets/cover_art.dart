part of '../music_player.dart';

class _CoverArt extends ConsumerWidget {
  const _CoverArt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.grey,
      child: const Icon(
        Icons.album,
        size: 250,
      ),
    );
  }
}
