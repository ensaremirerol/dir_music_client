part of '../event_pipe.dart';

class EventTypeListener extends EventListener {
  final EventTypes type;

  const EventTypeListener(
      {required super.name, required super.listener, required this.type});

  @override
  List<Object?> get props => [name, type];
}
