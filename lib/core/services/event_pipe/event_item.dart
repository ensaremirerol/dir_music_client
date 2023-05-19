part of './event_pipe.dart';

class EventItem<T> {
  final Type from;
  final T event;
  final EventTypes type;
  EventItem(
      {required this.from, required this.event, this.type = EventTypes.event});

  @override
  String toString() {
    return 'ErrorBucketItem{from: $from, type: ${type.name} event: $event}';
  }
}
