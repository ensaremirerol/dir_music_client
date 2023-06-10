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
    _audioPlayer.positionStream.listen((event) {
      _updateState();
    });
    _audioPlayer.bufferedPositionStream.listen((event) {
      _updateState();
    });
    _audioPlayer.durationStream.listen((event) {
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
        currentIndex: null,
        previousSongAvailable: false);
  }

  final _audioPlayer = InstanceController().getByType<AudioPlayer>();
  final _audioSession = InstanceController().getByType<AudioSession>();
  final _authService = InstanceController().getByType<AuthService>();

  void addSong(MetadataModel song) {
    final currentPlaylist = state.playlist ?? [];
    final newPlaylist = [...currentPlaylist];
    newPlaylist.add(song);
    final audioSource = _audioPlayer.audioSource as ConcatenatingAudioSource;
    audioSource.add(AudioSource.uri(Uri.parse(_createSongUrl(song)),
        headers: {
          'Authorization': 'Bearer ${_authService.accessToken}',
        },
        tag: song.id));
    state = state.copyWith(playlist: newPlaylist);
  }

  void removeSong(int index) {
    final currentPlaylist = state.playlist ?? [];
    final newPlaylist = [...currentPlaylist];
    newPlaylist.removeAt(index);
    final audioSource = _audioPlayer.audioSource as ConcatenatingAudioSource;
    audioSource.removeAt(index);
    state = state.copyWith(
      playlist: newPlaylist,
    );
  }

  void setPlaylist(List<MetadataModel> songs) async {
    await _audioPlayer.setAudioSource(_createPlaylist(songs));
    play();
    state = state.copyWith(playlist: songs);
  }

  void clearPlaylist() {
    _audioPlayer.setAudioSource(ConcatenatingAudioSource(children: []));
    state = state.copyWith(playlist: null);
  }

  void playSong(MetadataModel song) async {
    setPlaylist([song]);
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

  void skipTo(int i) {
    _audioPlayer.seek(Duration.zero, index: i);
  }

  ConcatenatingAudioSource _createPlaylist(List<MetadataModel> songs) {
    final ConcatenatingAudioSource playlist =
        ConcatenatingAudioSource(children: []);
    songs.forEach((song) {
      playlist.add(AudioSource.uri(Uri.parse(_createSongUrl(song)),
          tag: song.id,
          headers: {'Authorization': 'Bearer ${_authService.accessToken}'}));
    });
    return playlist;
  }

  void _updateState() {
    if (_audioPlayer.audioSource == null) {
      return;
    }
    final ConcatenatingAudioSource currentSource =
        _audioPlayer.audioSource as ConcatenatingAudioSource;
    MetadataModel? currentSong;

    try {
      currentSong = state.playlist?.firstWhere(
        (element) =>
            element.id ==
            (currentSource.children[_audioPlayer.currentIndex!]
                    as UriAudioSource)
                .tag,
      );
    } catch (e) {
      currentSong = null;
    }

    state = state.copyWith(
        isPlaying: _audioPlayer.playing,
        position: _audioPlayer.position,
        duration: _audioPlayer.duration ?? Duration.zero,
        bufferedPosition: _audioPlayer.bufferedPosition,
        nextSongAvailable: _audioPlayer.hasNext,
        previousSongAvailable: _audioPlayer.hasPrevious,
        currentIndex: _audioPlayer.currentIndex,
        currentSong: currentSong);
  }

  String _createSongUrl(MetadataModel song) {
    return 'http://localhost:8080/bff/songs/${song.id}/stream';
  }
}
