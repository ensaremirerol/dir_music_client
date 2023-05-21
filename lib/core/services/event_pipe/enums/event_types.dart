part of '../event_pipe.dart';

enum EventTypes { event, error, navigate }

extension EventTypesExtension on EventTypes {
  String get name {
    switch (this) {
      case EventTypes.event:
        return 'event';
      case EventTypes.error:
        return 'error';
      case EventTypes.navigate:
        return 'navigate';
    }
  }
}
