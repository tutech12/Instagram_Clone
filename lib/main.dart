import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instargramclone/views/homepage.dart';
import 'package:instargramclone/views/splashscreen.dart';

Future<void> main() async {

  await Future.delayed(const Duration(seconds: 3));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
  runApp(
    MaterialApp(
      // builder: (context,child){
      //   return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!);
      // },
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    ),
  );
}
