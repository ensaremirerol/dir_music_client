import 'package:audio_session/audio_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/utils/instance_controller.dart';
import '../../models/metadata/metadata_model.dart';
import '../../services/auth_service/auth_service.dart';
import 'music_controller_state/music_controller_state.dart';

final musicControllerProvider =
    NotifierProvider<MusicController, MusicControllerState>(
  () => MusicController(),
);

class MusicController extends Notifier<MusicControllerState> {
  @override
  MusicControllerState build() {
    _audioPlayer.playerStateStream.listen((event) {
      _updateState();
    });
    return MusicControllerState(
        currentSong: null,
        playlist: null,
        isPlaying: false,
        position: Duration.zero,
        duration: Duration.zero,
        bufferedPosition: Duration.zero,
        nextSongAvailable: false,
        previousSongAvailable: false);
  }

  final _audioPlayer = InstanceController().getByType<AudioPlayer>();
  final _audioSession = InstanceController().getByType<AudioSession>();
  final _authService = InstanceController().getByType<AuthService>();

  void addSong(MetadataModel song) {
    final currentPlaylist = state.playlist ?? [];
    currentPlaylist.add(song);
    _audioPlayer.setAudioSource(_createPlaylist(currentPlaylist));
    state = state.copyWith(playlist: currentPlaylist);
  }

  void removeSong(int index) {
    final currentPlaylist = state.playlist ?? [];
    currentPlaylist.removeAt(index);
    _audioPlayer.setAudioSource(_createPlaylist(currentPlaylist));
    state = state.copyWith(
      playlist: currentPlaylist,
    );
  }

  void clearPlaylist() {
    _audioPlayer.setAudioSource(ConcatenatingAudioSource(children: []));
    state = state.copyWith(playlist: null);
  }

  void playSong(MetadataModel song) async {
    await _audioPlayer.setUrl(_createSongUrl(song),
        headers: {'Authorization': 'Bearer ${_authService.accessToken}'});
    play();
    state = state.copyWith(currentSong: song);
  }

  void play() async {
    await _audioSession.setActive(true);
    await _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
    _audioSession.setActive(false);
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void next() {
    _audioPlayer.seekToNext();
  }

  void previous() {
    _audioPlayer.seekToPrevious();
  }

  void shuffle() {
    _audioPlayer.shuffle();
  }

  ConcatenatingAudioSource _createPlaylist(List<MetadataModel> songs) {
    final ConcatenatingAudioSource playlist =
        ConcatenatingAudioSource(children: []);
    songs.forEach((song) {
      playlist
          .add(AudioSource.uri(Uri.parse(_createSongUrl(song)), tag: song.id));
    });
    return playlist;
  }

  void _updateState() {
    state = state.copyWith(
      isPlaying: _audioPlayer.playing,
      position: _audioPlayer.position,
      duration: _audioPlayer.duration ?? Duration.zero,
      bufferedPosition: _audioPlayer.bufferedPosition,
      nextSongAvailable: _audioPlayer.hasNext,
      previousSongAvailable: _audioPlayer.hasPrevious,
    );
  }

  String _createSongUrl(MetadataModel song) {
    return 'http://localhost:8080/bff/songs/${song.id}/stream';
  }
}
