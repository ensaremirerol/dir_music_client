import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

import '../../utils/instance_controller.dart';

part 'enums/event_types.dart';
part 'event_item.dart';
part 'listeners/event_listener.dart';
part 'listeners/event_from_listener.dart';
part 'listeners/event_instance_listener.dart';
part 'listeners/event_type_listener.dart';

class EventPipe {
  final List<EventTypeListener> _eventTypeListeners = [];
  final List<EventFromListener> _eventFromListeners = [];
  final List<EventEventInstanceListener> _eventInstanceListeners = [];

  final _logger = InstanceController().getByType<Logger>();

  factory EventPipe() => _instance;
  EventPipe._internal();
  static EventPipe getInstance() => _instance;
  static final EventPipe _instance = EventPipe._internal();

  void addListener(EventListener listener) {
    if (listener is EventTypeListener) {
      _eventTypeListeners.add(listener);
    } else if (listener is EventFromListener) {
      _eventFromListeners.add(listener);
    } else if (listener is EventEventInstanceListener) {
      _eventInstanceListeners.add(listener);
    }
  }

  /// Removes the given listener
  void removeListener(EventListener listener) {
    if (listener is EventTypeListener) {
      _eventTypeListeners.remove(listener);
      _log('Removed EventTypeListener with name: ${listener.name}');
    } else if (listener is EventFromListener) {
      _eventFromListeners.remove(listener);
      _log('Removed EventFromListener with name: ${listener.name}');
    } else if (listener is EventEventInstanceListener) {
      _eventInstanceListeners.remove(listener);
      _log('Removed EventEventInstanceListener with name: ${listener.name}');
    } else {
      _log('Could not remove listener with name: ${listener.name}');
    }
  }

  /// Removes all listeners with the given name
  void removeListenersByName(String name) {
    _eventTypeListeners.removeWhere((element) => element.name == name);
    _eventFromListeners.removeWhere((element) => element.name == name);
    _eventInstanceListeners.removeWhere((element) => element.name == name);
    _log('Removed all listeners with name: $name');
  }

  void emit(EventItem event) {
    _log('Emitting event: $event');
    _eventTypeListeners.forEach((listener) {
      if (listener.type == event.type) {
        listener.emit(event);
      }
    });
    _eventFromListeners.forEach((listener) {
      if (listener.from == event.from) {
        listener.emit(event);
      }
    });
    _eventInstanceListeners.forEach((listener) {
      if (listener.eventInstance == event.event.runtimeType) {
        listener.emit(event);
      }
    });
    _log('Finished emitting event: $event');
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<EventPipe>: $message');
  }
}
