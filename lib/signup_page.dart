import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/login.dart';
import 'package:my_app/signup_with_email.dart';

import 'home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141520),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 10, left: 15, right: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Home(),), (route) => false);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xffAAADBE),
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                " Sign up",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffAAADBE)),
              ),
              const SizedBox(
                height: 30,
              ),
              buildElevatedButton(
                  onPressed: () => () {},
                  textColor: const Color(0xff141520),
                  backgroundColor: Colors.white,
                  name: "Continue with Google"),
              buildElevatedButton(
                  onPressed: () => () {},
                  textColor: Colors.white,
                  backgroundColor: const Color(0xff1877F2),
                  name: "Continue with Facebook"),
              buildElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupWithEmail(),
                    ),
                  );
                },
                backgroundColor: const Color(0xff31939F),
                textColor: Colors.white,
                name: "Sign up with your email",
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: "Already registered?  ",
                  style: const TextStyle(color: Colors.white70),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ));
                          },
                        text: "Log in",
                        style: const TextStyle(
                            color: Color(0xff31939F),
                            fontWeight: FontWeight.w500,
                            fontSize: 15))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildElevatedButton(
      {Function()? onPressed,
      Color? textColor,
      Color? backgroundColor,
      String? name,
      Size? minimumSize}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          minimumSize:
              minimumSize ?? Size(MediaQuery.of(context).size.width, 40)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$name",
              style: TextStyle(
                color: textColor,
              )),
        ],
      ),
    );
  }
}
