part of '../global_navigator.dart';

enum NavigateType {
  push,
  pushReplacement,
  pushAndRemoveUntil,
}

extension NavigateTypeExtension on NavigateType {
  String get value {
    switch (this) {
      case NavigateType.push:
        return 'push';
      case NavigateType.pushReplacement:
        return 'pushReplacement';
      case NavigateType.pushAndRemoveUntil:
        return 'pushAndRemoveUntil';
    }
  }
}
