import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/music_controller/music_controller.dart';
import '../../../controllers/music_controller/music_controller_state/music_controller_state.dart';
import '../../../utils/bounce_back/bounce_back.dart';
import '../states/position_state.dart';

class MusicPlayerController extends Notifier<PositionState> {
  bool _allowStateUpdate = true;

  final BounceBack _bounceBack = BounceBack();

  @override
  build() {
    ref.listen<MusicControllerState>(musicControllerProvider, (prev, next) {
      _updateState(next);
    });
    return PositionState(
      position: Duration.zero,
      bufferedPosition: Duration.zero,
      duration: Duration.zero,
    );
  }

  void setSeek(Duration position) {
    _allowStateUpdate = false;
    state = state.copyWith(position: position);
    _bounceBack.start(onComplete: () {
      ref.read(musicControllerProvider.notifier).seek(position);
      _allowStateUpdate = true;
    });
  }

  void _updateState(MusicControllerState musicControllerState) {
    if (_allowStateUpdate) {
      state = state.copyWith(
        position: musicControllerState.position,
        bufferedPosition: musicControllerState.bufferedPosition,
        duration: musicControllerState.duration,
      );
    }
  }
}
