part of '../global_navigator.dart';

class NavigateItem {
  final String route;
  final NavigateType type;

  NavigateItem({
    required this.route,
    required this.type,
  });

  @override
  String toString() {
    return 'NavigateItem(route: $route, type: $type)';
  }
}
