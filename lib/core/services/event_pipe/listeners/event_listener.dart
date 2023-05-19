part of '../event_pipe.dart';

abstract class EventListener extends Equatable {
  final String name;

  final Function(EventItem item) listener;

  const EventListener({required this.name, required this.listener});

  void emit(EventItem event) {
    listener(event);
  }
}
