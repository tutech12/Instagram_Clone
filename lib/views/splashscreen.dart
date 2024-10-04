import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instargramclone/views/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(children: [
      Align(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage('assets/Instagram_logo.png'),
            width: 60,
            height: 60,
          ))
    ]));
  }
}
