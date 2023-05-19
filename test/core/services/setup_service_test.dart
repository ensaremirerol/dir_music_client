import 'package:ensar_starter/core/services/setup_service/setup_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    final SetupService setupService = SetupService();
    setupService.clear();
  });
  test('Setup Service Successful Setup', () async {
    final SetupService setupService = SetupService();
    int x = 0;
    setupService.registerTask(SetupTask(
      name: 'Task 1',
      dependencies: [],
      task: () async {
        x++;
      },
    ));
    setupService.registerTask(SetupTask(
      name: 'Task 2',
      dependencies: ['Task 1'],
      task: () async {
        x++;
      },
    ));
    setupService.registerTask(SetupTask(
      name: 'Task 3',
      dependencies: ['Task 1'],
      task: () async {
        x++;
      },
    ));
    setupService.registerTask(SetupTask(
      name: 'Task 4',
      dependencies: ['Task 2', 'Task 3'],
      task: () async {
        x++;
      },
    ));
    await setupService.setup();
    expect(x, 4);
  });

  test('Setup Service Circular Dependency', () async {
    final SetupService setupService = SetupService();
    int x = 0;
    setupService.registerTask(SetupTask(
      name: 'Task 1',
      dependencies: ['Task 2'],
      task: () async {
        x++;
      },
    ));
    setupService.registerTask(SetupTask(
      name: 'Task 2',
      dependencies: ['Task 1'],
      task: () async {
        x++;
      },
    ));
    setupService.registerTask(SetupTask(
      name: 'Task 3',
      dependencies: ['Task 1'],
      task: () async {
        x++;
      },
    ));
    setupService.registerTask(SetupTask(
      name: 'Task 4',
      dependencies: ['Task 2', 'Task 3'],
      task: () async {
        x++;
      },
    ));
    await setupService.setup();
    expect(x, 0);
  });
}
