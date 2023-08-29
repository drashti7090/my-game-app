import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setRouting();
  }

  setRouting() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141520),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "PLAY PORTAL",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: "Audiowide",
            ),
          ),
        ],
      ),
    );
  }
}
