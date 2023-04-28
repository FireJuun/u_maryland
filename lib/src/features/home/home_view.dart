import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
        const Expanded(child: _Selections())
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

class _Selections extends HookConsumerWidget {
  const _Selections();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      thickness: 8,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12.0),
          child: Wrap(
            spacing: 12,
            runSpacing: 24,
            children: List.generate(150, (index) => const Text('text')),
          ),
        ),
      ),
    );
  }
}
