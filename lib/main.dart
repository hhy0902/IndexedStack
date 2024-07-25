import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indexedstack_exam/fragment/four_fragment.dart';
import 'package:indexedstack_exam/fragment/one_fragment.dart';
import 'package:indexedstack_exam/fragment/three_fragment.dart';
import 'package:indexedstack_exam/fragment/two_fragment.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

final bottomNavigationIndexProvider = StateProvider<int>((ref) => 0);

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  int selectedIndex = 0;

  final List<Widget> _fragments = [
    OneFragment(),
    TwoFragment(),
    ThreeFragment(),
    FourFragment(),
  ];

  void onTaped(int index) {
    setState(() {
      selectedIndex = index;
      ref.read(bottomNavigationIndexProvider.notifier).state = index;
      print(selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _fragments,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onTaped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'one'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'two'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'three'),
          BottomNavigationBarItem(icon: Icon(Icons.minimize), label: 'four'),
        ],
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   int selectedIndex = 0;
//
//   final List<Widget> _fragments = [
//     OneFragment(),
//     TwoFragment(),
//     ThreeFragment(),
//   ];
//
//   void onTaped(int index) {
//     setState(() {
//       selectedIndex = index;
//       print(selectedIndex);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: selectedIndex,
//         children: _fragments,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: onTaped,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'one'),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: 'two'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'three'),
//         ],
//       ),
//     );
//   }
// }
































