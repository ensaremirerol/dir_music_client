import 'dart:async';

import 'package:flutter/material.dart';

/// Add delays to your callbacks. It ignores all repeated calls except the last one.
class BounceBack {
  Timer? _timer;

  /// Add delay to onPressed callbacks. If another callback is called before the delay is over, first callback is cancelled.
  void start(
      {Duration duration = const Duration(milliseconds: 500),
      required VoidCallback onComplete}) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(duration, onComplete);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
