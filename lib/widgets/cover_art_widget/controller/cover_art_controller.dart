import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/instance_controller.dart';
import '../../../services/cover_art_service/cover_art_service.dart';

class CoverArtController extends FamilyAsyncNotifier<MemoryImage?, String> {
  final _coverArtService = InstanceController().getByType<CoverArtService>();

  @override
  FutureOr<MemoryImage?> build(String arg) async {
    final coverArt = await _coverArtService.getCoverArt(arg);
    return coverArt;
  }
}
