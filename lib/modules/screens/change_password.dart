import 'package:flutter/material.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final passwordController = TextEditingController();

  final confimPasswordController = TextEditingController();

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
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                  text: TextSpan(
                      text: 'Change your Password',
                      style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue))),
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
              child: Text('Enter the details to change your password.',
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 14)),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Enter your OTP',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        OtpTextField(
            numberOfFields: 4,
            fieldWidth: 50,
            borderColor: Colors.black,
            margin: EdgeInsets.symmetric(horizontal: 15),
            showFieldAsBox:
                true, //set to true to show as box or false to show as dash
            onCodeChanged: (String code) {
              //handle validation or checks here
            }),
        SizedBox(
          height: 20,
        ),
        LoginTextField(
            hintText: 'Password',
            type: TextInputType.visiblePassword,
              errorText: checkValidate? 'Please enter password' : null,
            controller: passwordController),
        SizedBox(
          height: 20,
        ),
        LoginTextField(
            hintText: 'Confirm Password',
            type: TextInputType.visiblePassword,
              errorText: checkValidate? 'Please enter confirm password' : null,
            controller: confimPasswordController),
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
                  Navigator.pushNamed(context, '/');
                })),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ]),
    );
    ;
  }
}
