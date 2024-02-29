import 'package:flutter/material.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetScreen extends StatefulWidget {
  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final emailController = TextEditingController();

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

  @override
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
        child: Column(children: [
          SizedBox(
            height: 150,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    text: TextSpan(
                        text: 'Forget Password',
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
                child: Text('Enter your email to verify',
                    style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 14)),
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
            errorText: checkValidate ? 'Please enter confirm password' : null,
          ),
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
                  child: Text('Proceed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  onPressed: (() {
                    Navigator.pushNamed(context, '/changePassword');
                  })),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
