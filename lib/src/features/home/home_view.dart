import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:u_maryland/src/features/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('text'),
      ),
      body: const SafeArea(child: _Body()),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/testudo-statue.png'),
        const Text('text'),
        const Text('text'),
        const Text('text'),
      ],
    );
  }
}

class _BottomNavBar extends ConsumerWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeIndex = ref.watch(homeIndexProvider);
    return BottomNavigationBar(
        currentIndex: homeIndex,
        onTap: (value) => ref.read(homeIndexProvider.notifier).setValue(value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sms_outlined), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps_outlined), label: 'Menu'),
        ]);
  }
}
