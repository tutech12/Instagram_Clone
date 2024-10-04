import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:instargramclone/views/homepage.dart';
import 'package:instargramclone/views/splashscreen.dart';

Future<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // FlutterNativeSplash.remove();
  await Future.delayed(const Duration(seconds: 3));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
  runApp(
    const MaterialApp(
      // builder: (context,child){
      //   return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!);
      // },
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    ),

  );




}
