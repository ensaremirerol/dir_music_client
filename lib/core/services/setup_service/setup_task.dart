part of './setup_service.dart';

class SetupTask {
  final String name;
  final List<String> dependencies;
  final FutureOr<void> Function() task;

  const SetupTask({
    required this.name,
    required this.dependencies,
    required this.task,
  });
}
