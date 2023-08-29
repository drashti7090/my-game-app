import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141520),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, left: 15, right: 15, bottom: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.close,
                          color: Color(0xffAAADBE),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Log in",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffAAADBE)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buildElevatedButton(
                      onPressed: () => () {},
                      textColor: Color(0xff141520),
                      backgroundColor: Colors.white,
                      name: "Continue with Google"),
                  buildElevatedButton(
                      onPressed: () => () {},
                      textColor: Colors.white,
                      backgroundColor: Color(0xff1877F2),
                      name: "Continue with Facebook"),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, right: 25, left: 25, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0xff3B3C4A)))),
                        ),
                        Text("OR",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        Container(
                          width: 180,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0xff3B3C4A)))),
                        )
                      ],
                    ),
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
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Color(0xff31939F)),
                        )),
                  ),
                  buildElevatedButton(
                    name: "Log in",
                    onPressed: () {},
                    textColor: Colors.white,
                    backgroundColor: Color(0xff31939F),
                    minimumSize: Size(MediaQuery.of(context).size.width, 45),
                  ),
                  SizedBox(height: 30,),
                  RichText(
                    text: TextSpan(
                      text: "New to PlayPortal?  ",style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                            },
                        text: "Join Now",style: TextStyle(color: Color(0xff31939F),fontWeight: FontWeight.w500,fontSize: 15))
                      ],
                    ),
                  ),
                ],
              ),
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
// Continue with Google     Continue with Facebook      0xff1877F2
