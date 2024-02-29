import 'dart:ui';
import 'dart:convert';

import 'package:cloudstok_ticketing/home.dart';
import 'package:cloudstok_ticketing/modules/screens/forget.dart';
import 'package:cloudstok_ticketing/modules/screens/pages/homepage.dart';
import 'package:cloudstok_ticketing/modules/screens/signup.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloudstok_ticketing/config/NetworkHandler.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  NetworkHandler networkHandler = NetworkHandler();
  final storage = FlutterSecureStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLogin = true;
  bool checkValidate = false;

  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        checkValidate = true;
      });
      return false;
    }
    setState(() {
      checkValidate = false;
    });
    return true;
  }

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    bool vis = true;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Cloudstok',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                        text: TextSpan(
                            text: 'Sign In',
                            style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.red))),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Enter your details to get started.',
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 14)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              LoginTextField(
                hintText: 'Email',
                type: TextInputType.emailAddress,
                controller: emailController,
                errorText: checkValidate ? 'Please Enter Email' : null,
              ),
              SizedBox(
                height: 20,
              ),
              LoginTextField(
                  hintText: 'Password',
                  type: TextInputType.visiblePassword,
                  controller: passwordController,
                  errorText: checkValidate ? 'Please Enter Password' : null),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blue,
                      minWidth: 300,
                      height: 50,
                      child: Text('Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                      onPressed: (() async {
                        validateTextField(emailController.text);
                        validateTextField(passwordController.text);

                        Map<String, String> data = {
                          "email": emailController.text,
                          "password": passwordController.text,
                        };
                        var response = await networkHandler.post("login", data);
                        print(response.body);

                        switch (response.statusCode) {
                          case (200):
                            Map<String, dynamic> output =
                                json.decode(response.body);
                            print(output["token"]);
                            await storage.write(
                                key: 'name', value: output["name"]);
                            await storage.write(
                                key: "token", value: output["token"]);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                                (route) => false);
                            break;
                          case 422:
                            String output = json.decode(response.body);
                            final snackBar = SnackBar(
                              content: Text('Incorrect Pasw '),
                              backgroundColor: (Colors.black),
                              action: SnackBarAction(
                                  label: 'dismiss', onPressed: () {}),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            break;

                          default:
                            String output = json.decode(response.body);
                            print(output);
                            final snackBar = SnackBar(
                              content: Text(output.toString()),
                              backgroundColor: (Colors.black),
                              action: SnackBarAction(
                                  label: 'dismiss', onPressed: () {}),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                        }
                      })),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetScreen()));
                },
                child: Text('Forgot your password?',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(decoration: TextDecoration.underline))),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need an Account? ',
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 14)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text('Sign Up',
                          style: GoogleFonts.poppins(fontSize: 14)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
