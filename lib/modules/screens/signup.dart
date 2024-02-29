import 'dart:convert';

import 'package:cloudstok_ticketing/core/auth/register.dart';
import 'package:cloudstok_ticketing/modules/screens/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloudstok_ticketing/config/NetworkHandler.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();

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

  RegisterAuthentication registerAuthentication = RegisterAuthentication();
  var jsonData;

  Widget build(BuildContext context) {
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
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                        text: TextSpan(
                            text: 'Sign Up',
                            style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.green))),
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
                    child: Text('Enter your details to get register.',
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 14)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              LoginTextField(
                  hintText: 'Name',
                  type: TextInputType.name,
                  errorText: checkValidate ? 'Please enter name' : null,
                  controller: nameController),
              SizedBox(
                height: 20,
              ),
              LoginTextField(
                  hintText: 'Email',
                  type: TextInputType.emailAddress,
                  errorText: checkValidate ? 'Please enter email' : null,
                  controller: emailController),
              SizedBox(
                height: 20,
              ),
              LoginTextField(
                  hintText: 'Password',
                  type: TextInputType.visiblePassword,
                  errorText: checkValidate ? 'Please enter password' : null,
                  controller: passwordController),
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
                      child: Text('Create Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                      onPressed: (() async {
                        print(nameController.text +
                            " " +
                            emailController.text +
                            " " +
                            passwordController.text);
                        Map<String, String> data = {
                          "name": nameController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                        };
                        // Navigator.pushNamed(context, '/');  // Navigator.pushNamed(context, '/');
                        validateTextField(nameController.text);
                        validateTextField(passwordController.text);
                        validateTextField(emailController.text);

                        var response =
                            await networkHandler.post('register', data);
                        if (response.statusCode == 200) {
                          final data = json.decode(response.body);
                          final snackBar = SnackBar(
                            content: Text(data['message']),
                            backgroundColor: (Colors.black),
                            action: SnackBarAction(
                                label: 'dismiss', onPressed: () {}),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        } else if (response.statusCode == 201) {
                          final data = json.decode(response.body);
                          final snackBar = SnackBar(
                            content: Text('Account created successfully.'),
                            backgroundColor: (Colors.black),
                            action: SnackBarAction(
                                label: 'dismiss', onPressed: () {}),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        //   registerAuthentication.createUser(
                        //       nameController.text.toString(),
                        //       emailController.text.toString(),
                        //       passwordController.text.toString());
                      })),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account? ',
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 14)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text('Sign In',
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
