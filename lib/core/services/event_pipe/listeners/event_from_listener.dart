part of '../event_pipe.dart';

class EventFromListener extends EventListener {
  final Type from;

  const EventFromListener(
      {required super.name, required super.listener, required this.from});

  @override
  List<Object?> get props => [name, from];
}
