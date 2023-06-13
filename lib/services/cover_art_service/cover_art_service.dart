import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:logger/logger.dart';

import '../../core/services/api_service/api_service.dart';
import '../../core/utils/instance_controller.dart';
import '../api_service/calls/cover_art/get_cover_art_api_call.dart';

class CoverArtService {
  final CacheManager _cacheManager = DefaultCacheManager();
  final ApiService _apiService = InstanceController().getByType<ApiService>();
  final _logger = InstanceController().getByType<Logger>();

  Future<MemoryImage?> getCoverArt(String id) async {
    final file = await _cacheManager.getFileFromCache('cover_art_$id');
    if (file != null) {
      _log('Cover art for song with id $id found in cache', level: Level.info);
      return MemoryImage(file.file.readAsBytesSync());
    }
    _log('Cover art for song with id $id not found in cache',
        level: Level.info);
    final response = await _apiService.call(
        const GetCoverArtApiCall(), GetCoverArtApiCallArgs(id: id));

    if (response.statusCode ~/ 100 == 2 && response.data != null) {
      await _cacheManager.putFile('cover_art_$id', response.data!.bytes,
          eTag: id, maxAge: const Duration(days: 7));
      return response.data;
    }

    _log(
        'Failed to get cover art for song with id $id\n Error: ${response.error_code}',
        level: Level.error);

    return null;
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<CoverArtService>: $message');
  }
}
