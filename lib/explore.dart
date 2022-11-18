import 'package:flutter/material.dart';
import 'package:test_flutter/components/bottomnav.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
