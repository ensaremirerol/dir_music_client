import 'package:ensar_starter/core/services/event_pipe/event_pipe.dart';
import 'package:ensar_starter/core/utils/instance_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() {
  setUpAll(() => {InstanceController().addInstance(Logger, Logger())});
  test('Event Pipe Test', () {
    int x = 0;
    final EventTypeListener listener = EventTypeListener(
      name: 'test',
      listener: (event) {
        x = 1;
      },
      type: EventTypes.event,
    );
    final EventPipe eventPipe = EventPipe.getInstance();
    eventPipe.addListener(listener);
    eventPipe.emit(EventItem<String>(from: Object, event: 'Test Event'));
    expect(x, 1);
  });
}
