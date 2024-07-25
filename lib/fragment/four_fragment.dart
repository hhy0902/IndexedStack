


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indexedstack_exam/main.dart';

class FourFragment extends ConsumerWidget {
  const FourFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(bottomNavigationIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Four Fragment'),
      ),
      body: Center(
        child: Text(value.toString()),
      ),
    );
  }
}
