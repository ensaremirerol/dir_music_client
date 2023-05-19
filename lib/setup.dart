import 'package:logger/logger.dart';

import 'core/services/api_service/api_service.dart';
import 'core/services/setup_service/setup_service.dart';
import 'core/utils/instance_controller.dart';

final setupTasks = [
  SetupTask(
      name: 'Logger',
      dependencies: [],
      task: () => InstanceController().addInstance(Logger, Logger())),
  SetupTask(
      name: 'ApiService',
      dependencies: ['Logger'],
      task: () => InstanceController().addInstance(
          ApiService,
          ApiService(
            baseUrl: 'localhost:8080',
          )))
];
