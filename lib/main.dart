import 'package:flutter/material.dart';
import 'package:my_app/login.dart';
import 'package:my_app/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "my app",
       home: SplashScreen(),
      // home: Login(),

    )
  );
}
