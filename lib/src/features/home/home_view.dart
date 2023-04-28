import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
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

class _Body extends HookWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => animationController.loop(count: 1),
            child: Image.asset('assets/testudo-statue.png')
                .animate(controller: animationController)
                .shimmer()),
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
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 12,
            runSpacing: 24,
            children: [
              ..._items,
              Container(
                  width: double.infinity,
                  color: Theme.of(context).disabledColor,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Twitter Messages',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
      {required this.text, required this.onPressed, required this.icon});

  final String text;
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48),
            const Gap(12),
            Text(
              text,
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

final List<Widget> _items = [
  _Item(
      text: 'Calendar', icon: Icons.calendar_month_outlined, onPressed: () {}),
  _Item(text: 'UMD Dining', icon: Icons.flatware_outlined, onPressed: () {}),
  _Item(
      text: 'Directory', icon: Icons.account_circle_outlined, onPressed: () {}),
  _Item(text: 'Report Issue', icon: Icons.wifi_outlined, onPressed: () {}),
  _Item(text: 'Map', icon: Icons.map, onPressed: () {}),
  _Item(text: 'Indoor Maps', icon: Icons.map_outlined, onPressed: () {}),
  _Item(text: 'Find a Space', icon: Icons.pin_drop_outlined, onPressed: () {}),
  _Item(
      text: 'Shuttle-UM',
      icon: Icons.directions_bus_filled_outlined,
      onPressed: () {}),
  _Item(text: 'Get Involved', icon: Icons.inventory_outlined, onPressed: () {}),
  _Item(
      text: 'Libraries', icon: Icons.library_books_outlined, onPressed: () {}),
  _Item(text: 'Courses', icon: Icons.menu_book_outlined, onPressed: () {}),
  _Item(
      text: 'Contact Us',
      icon: Icons.perm_contact_cal_outlined,
      onPressed: () {}),
  _Item(text: 'Help Desk', icon: Icons.map_outlined, onPressed: () {}),
  _Item(text: 'RecWell', icon: Icons.favorite_outline, onPressed: () {}),
  _Item(text: 'Counseling', icon: Icons.chat_bubble_outline, onPressed: () {}),
  _Item(text: 'COVID Info', icon: Icons.sick_outlined, onPressed: () {}),
  _Item(text: 'Police', icon: Icons.local_police_outlined, onPressed: () {}),
];
