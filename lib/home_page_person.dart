import 'package:flutter/material.dart';

class HomePerson extends StatefulWidget {
  const HomePerson({super.key});

  @override
  State<HomePerson> createState() => _HomePersonState();
}

class _HomePersonState extends State<HomePerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141520),
      body: Stack(
        children: [
          Image.asset("assets/images/home_Person_container.png",fit: BoxFit.fill,width: MediaQuery.of(context).size.width,height: 200),
          Column(children: [

          ]),
        ],
      ),
    );
  }
}
