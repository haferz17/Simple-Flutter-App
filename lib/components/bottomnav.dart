import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/controllers/navigation.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int tab = 0;

  void changeScreen(var name, int tabIndex) {
    Navigator.pushNamed(context, name);
    setState(() {
      tab = tabIndex;
    });
  }

  void onClickTab(int index) {
    switch (index) {
      case 1:
        changeScreen('/explore', index);
        break;
      case 2:
        changeScreen('/profile', index);
        break;
      default:
        changeScreen('/', index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onClickTab,
      currentIndex: tab,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profile')
      ],
    );
  }
}
