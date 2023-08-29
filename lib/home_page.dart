import 'package:flutter/material.dart';

import 'home_page_person.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff141520),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width / 2,
            backgroundColor: Color(0xff141520).withOpacity(0.90),
            shadowColor: Color(0xff1F2030),
            elevation: 10,
            shape: Border(
                right: BorderSide(
              width: 1.5,
              color: Color(0xff1F2030),
            )),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Align(alignment: Alignment.topLeft,

                )
              ]),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xff1F2030),
            elevation: 20,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Color(0xffAAADBE),
                  )),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: const CircleBorder(
                        side: BorderSide(),
                      ),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 0.5,
                      ),
                      elevation: 10,
                      padding: EdgeInsets.all(0),
                      // fixedSize: Size(50, 50),
                      minimumSize: Size(30, 30),
                      shadowColor: Colors.white10),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePerson(),));
                  },
                  child: const Center(
                    child: Icon(
                      Icons.person_2_rounded,
                      size: 20,
                      color: Color(0xffAAADBE),
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          body: Column(
            children: [],
          )),
    );
  }
}
//dark shade 246C76   light shade 31939F