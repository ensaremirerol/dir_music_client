import 'dart:async';

import 'package:logger/logger.dart';

part './setup_task.dart';

class SetupService {
  static final SetupService _instance = SetupService._internal();
  SetupService._internal();
  factory SetupService() => _instance;
  static SetupService get instance => _instance;

  final Logger _logger = Logger();

  final Map<String, SetupTask> _tasks = {};

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<SetupService>: $message');
  }

  void registerTask(SetupTask task) {
    _log('Registering task: ${task.name}');
    if (_tasks.containsKey(task.name)) {
      _log(
          'Task already registered: ${task.name}\n Do you have a duplicate task?',
          level: Level.error);
      return;
    }
    _tasks[task.name] = task;
  }

  void registerAllTasks(List<SetupTask> tasks) {
    _log('Registering all tasks');
    for (final SetupTask task in tasks) {
      registerTask(task);
    }
  }

  Future<void> setup() async {
    _log('Starting setup');
    final List<String> taskNames = _tasks.keys.toList();
    final List<String> taskNamesCompleted = [];
    // Complete all tasks that have no dependencies
    for (final String _taskName in taskNames) {
      final SetupTask _task = _tasks[_taskName]!;
      if (_task.dependencies.isEmpty) {
        _log('Running task: ${_task.name}');
        await _task.task();
        taskNamesCompleted.add(_task.name);
      }
    }
    if (taskNamesCompleted.isEmpty) {
      _log(
          'Could not find task to run\nThis usually means you have a circular dependency\n Tasks remaining: $taskNames',
          level: Level.error);
      return;
    }
    for (final String taskName in taskNamesCompleted) {
      taskNames.remove(taskName);
    }

    while (taskNamesCompleted.length < taskNames.length) {
      final List<String> completedTasksThisLoop = [];
      for (final String taskName in taskNames) {
        final SetupTask _task = _tasks[taskName]!;
        if (_task.dependencies.every(
            (String dependency) => taskNamesCompleted.contains(dependency))) {
          _log('Running task: ${_task.name}');
          await _task.task();
          taskNamesCompleted.add(_task.name);
          completedTasksThisLoop.add(_task.name);
        }
      }
      if (completedTasksThisLoop.isEmpty) {
        _log(
            'Could not find task to run\nThis usually means you have a circular dependency\n Tasks remaining: $taskNames',
            level: Level.error);
        break;
      }
      for (final String taskName in completedTasksThisLoop) {
        taskNames.remove(taskName);
      }
    }
  }

  void clear() {
    _log('Clearing tasks');
    _tasks.clear();
  }
}
