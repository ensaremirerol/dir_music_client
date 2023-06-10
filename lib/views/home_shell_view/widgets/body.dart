part of '../home_shell_view.dart';

class _Body extends ConsumerWidget {
  const _Body({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeViewIndexProvider);
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: child,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: MiniMusicPlayer(),
            ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(splashFactory: InkRipple.splashFactory),
          child: BottomNavigationBar(
              currentIndex: index,
              iconSize: 30,
              onTap: (index) {
                ref.read(homeViewIndexProvider.notifier).state = index;
              },
              items: navigationItems
                  .map((e) => e.toBottomNavigationBarItem())
                  .toList()),
        ));
  }
}
