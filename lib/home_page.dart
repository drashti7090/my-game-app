import 'package:flutter/material.dart';

import 'home_page_person.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List gameList = [
    {
      "name": "All Games",
      "game": ["1", "2", "3", "4"]
    },
    {"name": "Action", "game": []},
    {"name": "Puzzle", "game": []},
    {"name": "Arcade", "game": []},
    {"name": "Racing", "game": []},
    {"name": "3D", "game": []},
    {"name": "Casual", "game": []},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff141520),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 2,
        backgroundColor: const Color(0xff141520).withOpacity(0.90),
        shadowColor: const Color(0xff1F2030),
        elevation: 10,
        shape: const Border(
            right: BorderSide(
          width: 1.5,
          color: Color(0xff1F2030),
        )),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
            )
          ]),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff1F2030),
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
                  padding: const EdgeInsets.all(0),
                  // fixedSize: Size(50, 50),
                  minimumSize: const Size(30, 30),
                  shadowColor: Colors.white10),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePerson(),
                    ));
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
      body: GridView.builder(
        itemCount: gameList.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GameScreen(gameList: gameList[index]['game']),
                  ));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(gameList[index]['name'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
            ),
          );
        },
      ),
    ));
  }
}

class GameScreen extends StatefulWidget {
  List gameList = [];

  GameScreen({super.key, required this.gameList});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("All in one Game"),
      ),
      body: GridView.builder(
        itemCount: widget.gameList.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15)),
              child: Text(widget.gameList[index],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
            ),
          );
        },
      ),
    );
  }
}
//dark shade 246C76   light shade 31939F
