import 'package:flutter/material.dart';
import 'package:test_flutter/splash.dart';
import 'package:test_flutter/auth.dart';
import 'dart:async';
import 'package:test_flutter/home.dart';
import 'package:test_flutter/explore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyPage();
}

class MyPage extends State<MyApp> {
  var isSplash = true;

  @override
  void initState() {
    super.initState();
    Timer _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        isSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      // home: isSplash ? const Splash() : const Auth(page: 'Login'),
      // home: Navigator(pages: [MaterialPage(child: Home())]),
      initialRoute: '/',
      routes: {
        '/': (context) => isSplash ? const Splash() : const Auth(page: 'Login'),
        '/explore': (context) => const Explore()
      },
    );
  }
}
