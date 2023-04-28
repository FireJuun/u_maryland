import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'counter.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: const _Fab(),
    );
  }
}

class _Fab extends ConsumerWidget {
  const _Fab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const Gap(12),
        FloatingActionButton(
          onPressed: () => ref.read(counterProvider.notifier).decrement(),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        )
      ],
    );
  }
}
