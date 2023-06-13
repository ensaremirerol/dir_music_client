import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/mini_music_player.dart';
import '../../widgets/responsive_builder/responsive_builder.dart';

part './widgets/body.dart';

final homeViewIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class NavigationItem {
  final String label;
  final IconData icon;
  final String route;
  const NavigationItem(
      {required this.label, required this.icon, required this.route});

  BottomNavigationBarItem toBottomNavigationBarItem() {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label.tr(),
    );
  }
}

const navigationItems = <NavigationItem>[
  NavigationItem(label: 'home', icon: Icons.home, route: '/home'),
  NavigationItem(label: 'search', icon: Icons.search, route: '/search'),
  NavigationItem(label: 'profile', icon: Icons.person, route: '/profile'),
];

class HomeShellView extends ConsumerWidget {
  const HomeShellView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(
      homeViewIndexProvider,
      (previous, next) {
        context.go(navigationItems[next].route);
      },
    );
    return ResponsiveBuilder(
        smallScreen: _Body(
      key: key,
      child: child,
    ));
  }
}
