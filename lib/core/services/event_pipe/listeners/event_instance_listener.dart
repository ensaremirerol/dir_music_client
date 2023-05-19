part of '../event_pipe.dart';

class EventEventInstanceListener extends EventListener {
  final Type eventInstance;

  const EventEventInstanceListener({
    required super.name,
    required super.listener,
    required this.eventInstance,
  });

  @override
  List<Object?> get props => [name, eventInstance];
}
