import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/cover_art_controller.dart';

final coverArtControllerProvider =
    AsyncNotifierProvider.family<CoverArtController, MemoryImage?, String>(
  () => CoverArtController(),
);

class CoverArtWidget extends ConsumerWidget {
  const CoverArtWidget({super.key, required this.id, this.errorSize})
      : notPlaying = false;
  const CoverArtWidget.notPlaying({super.key, this.errorSize})
      : notPlaying = true,
        id = -1;

  final int id;
  final bool notPlaying;
  final double? errorSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (notPlaying) {
      return Hero(
        tag: 'album-art_${id}',
        child: Icon(
          Icons.album,
          size: errorSize,
          color: Colors.grey,
        ),
      );
    }
    final coverArt = ref.watch(coverArtControllerProvider(id.toString()));
    return Hero(
      tag: 'album-art_${id}',
      child: coverArt.when(
        data: (data) => data != null
            ? Image(
                image: data,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.album,
                size: errorSize,
                color: Colors.grey,
              ),
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Icon(
          Icons.album,
          size: errorSize,
          color: Colors.grey,
        ),
      ),
    );
  }
}
