part of '../music_player.dart';

class _Data extends ConsumerWidget {
  const _Data({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(musicControllerProvider);
    final positionState = ref.watch(musicPlayerProvider);
    return Column(
      children: [
        Text(
          state.currentSong?.title ?? 'no_song_playing'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(state.currentSong?.artist ?? ''),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${positionState.position.inMinutes}:'
                      '${positionState.position.inSeconds.remainder(60).toString().padLeft(2, '0')}'),
                  Text(
                      '${positionState.duration.inMinutes}:${positionState.duration.inSeconds.remainder(60).toString().padLeft(2, '0')}'),
                ],
              ),
              Slider(
                  secondaryTrackValue: state.currentSong != null
                      ? _getSliderValue(positionState.bufferedPosition,
                          positionState.duration)
                      : 0.0,
                  value: state.currentSong != null
                      ? _getSliderValue(
                          positionState.position, positionState.duration)
                      : 0.0,
                  onChanged: (value) {
                    final duration = state.duration;
                    final position = duration * value;
                    ref.read(musicPlayerProvider.notifier).setSeek(position);
                  }),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.skip_previous, size: 30),
              onPressed: state.previousSongAvailable
                  ? () {
                      ref.read(musicControllerProvider.notifier).previous();
                    }
                  : null,
            ),
            IconButton(
              icon: Icon(
                  state.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  size: 70),
              onPressed: () {
                if (state.isPlaying) {
                  ref.read(musicControllerProvider.notifier).pause();
                } else {
                  ref.read(musicControllerProvider.notifier).play();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next, size: 30),
              onPressed: state.nextSongAvailable
                  ? () {
                      ref.read(musicControllerProvider.notifier).next();
                    }
                  : null,
            ),
          ],
        )
      ],
    );
  }

  double _getSliderValue(Duration value, Duration duration) {
    if (value.inSeconds == 0 || duration.inSeconds == 0) {
      return 0.0;
    }
    return value.inSeconds.toDouble() / duration.inSeconds.toDouble();
  }
}
