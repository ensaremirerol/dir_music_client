part of '../event_pipe.dart';

enum EventTypes { event, error }

extension EventTypesExtension on EventTypes {
  String get name {
    switch (this) {
      case EventTypes.event:
        return 'event';
      case EventTypes.error:
        return 'error';
    }
  }
}
