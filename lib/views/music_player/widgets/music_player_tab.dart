part of '../music_player.dart';

class _MusicPlayerTab extends ConsumerWidget {
  const _MusicPlayerTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _CoverArt(),
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
