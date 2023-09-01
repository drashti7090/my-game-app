import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';

import 'login.dart';

class SignupWithEmail extends StatefulWidget {
  const SignupWithEmail({super.key});

  @override
  State<SignupWithEmail> createState() => _SignupWithEmailState();
}

class _SignupWithEmailState extends State<SignupWithEmail> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141520),
      body: SafeArea(
        child: SafeArea(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10, right: 15, left: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Color(0xffAAADBE),
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  " Sign up with email",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffAAADBE)),
                ),
                SizedBox(
                  height: 30,
                ),
                buildTextFormField(
                  controller: emailController,
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Email address";
                    } else if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return "enter valid email address";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                buildTextFormField(
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  hintText: "Password",
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value!)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: "I accept the ",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Terms and Conditions",
                          style: TextStyle(
                              color: Color(0xff31939F),
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Privacy Policy",
                          style: TextStyle(
                              color: Color(0xff31939F),
                              fontWeight: FontWeight.w500,
                              fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                buildElevatedButton(
                  name: "Continue",
                  textColor: Colors.white70,
                  backgroundColor: Color(0xff31939F),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home(),), (route) => false);
                  },
                  minimumSize: Size(MediaQuery.of(context).size.width, 45),
                ),
                SizedBox(height: 20,),
                RichText(
                  text: TextSpan(
                    text: "Already registered?  ",
                    style: TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            },
                          text: "Log in",
                          style: TextStyle(
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
      ),
    );
  }

  TextFormField buildTextFormField(
      {TextEditingController? controller,
      String? Function(String?)? validator,
      TextInputType? keyboardType,
      bool? obscureText,
      String? hintText}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
      decoration: InputDecoration(
          fillColor: Colors.white12,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff246C76)),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          hintStyle: TextStyle(
            color: Colors.white60.withOpacity(0.5),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          )),
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
          shape: RoundedRectangleBorder(
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
