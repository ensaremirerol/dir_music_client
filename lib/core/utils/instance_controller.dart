import 'package:logger/logger.dart';

/// Singleton controller for global variables.
class InstanceController {
  InstanceController._();

  static final InstanceController _instance = InstanceController._();

  factory InstanceController() => _instance;

  final Map<dynamic, Object> _instances = {};

  final Logger _logger = Logger();

  void addInstance(dynamic key, Object instance) {
    _instances[key] = instance;
    _log('Instance added: $key');
  }

  operator [](dynamic key) => _instances[key];

  T getByType<T>() {
    return _instances[T] as T;
  }

  T getByKey<T>(dynamic key) {
    return _instances[key] as T;
  }

  void removeByKey(dynamic key) {
    _instances.remove(key);
    _log('Instance removed: $key');
  }

  void removeByType<T>() {
    _instances.remove(T);
    _log('Instance removed: $T');
  }

  void removeAll() {
    _instances.clear();
    _log('All instances removed');
  }

  void _log(String message, {Level level = Level.info}) {
    _logger.log(level, '<InstanceController>: $message');
  }
}
