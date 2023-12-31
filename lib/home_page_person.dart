import 'package:flutter/material.dart';
import 'package:my_app/login.dart';
import 'package:my_app/signup_page.dart';

class HomePerson extends StatefulWidget {
  const HomePerson({super.key});

  @override
  State<HomePerson> createState() => _HomePersonState();
}

class _HomePersonState extends State<HomePerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141520),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset("assets/images/home_person_container.png",
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: 220),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xffAAADBE),
                      )),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Create your Play Poratal\n account for free!",
                  style: TextStyle(color: Colors.white70, fontSize: 23,fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      child: const Text("Log in",
                          style: TextStyle(color: Color(0xff246C76), fontSize: 17),),
                    ),
                    const SizedBox(width: 30,),
                    OutlinedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp(),));

                    },
                    style: OutlinedButton.styleFrom( foregroundColor: Colors.white70,
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),), child:const Text("Sign up",
                      style: TextStyle(color: Colors.white70, fontSize: 17),),),
                    const SizedBox(width: 40,)
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
