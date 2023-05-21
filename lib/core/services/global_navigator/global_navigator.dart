import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../utils/instance_controller.dart';
import '../event_pipe/event_pipe.dart';

part './enums/navigate_type.dart';
part './models/navigate_item.dart';

class GlobalNavigator {
  final Logger _logger = InstanceController().getByType<Logger>();
  final GlobalKey<NavigatorState> _navigatorKey;
  final EventPipe _eventPipe = EventPipe();

  GlobalNavigator(this._navigatorKey) {
    _eventPipe.addListener(EventTypeListener(
        name: 'Navigate Request',
        listener: (item) {
          _log('Navigate Request');
          if (item.event is NavigateItem) {
            navigate(item.event as NavigateItem);
          } else {
            _log('Invalid Event Type');
          }
        },
        type: EventTypes.navigate));
  }

  void navigate(NavigateItem navigateItem) {
    _log('Navigate Request - Navigate Item: ${navigateItem} - Start');
    switch (navigateItem.type) {
      case NavigateType.push:
        _navigatorKey.currentState!.pushNamed(navigateItem.route);
        break;
      case NavigateType.pushReplacement:
        _navigatorKey.currentState!.pushReplacementNamed(navigateItem.route);
        break;
      case NavigateType.pushAndRemoveUntil:
        _navigatorKey.currentState!
            .pushNamedAndRemoveUntil(navigateItem.route, (route) => false);
        break;
    }
    _log('Navigate Request - Navigate Item: ${navigateItem} - Done');
  }

  void _log(String message, {Level level = Level.debug}) {
    _logger.log(level, '<GlobalNavigator>: $message');
  }
}
