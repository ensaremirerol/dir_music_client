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
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            )),
            const _MiniMusicPlayer(),
          ],
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: index,
              onTap: (index) {
                ref.read(homeViewIndexProvider.notifier).state = index;
              },
              items: navigationItems
                  .map((e) => e.toBottomNavigationBarItem())
                  .toList()),
        ));
  }
}
