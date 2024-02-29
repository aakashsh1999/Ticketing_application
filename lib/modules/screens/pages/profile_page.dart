import 'package:cloudstok_ticketing/constants/colors.dart';
import 'package:cloudstok_ticketing/modules/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = FlutterSecureStorage();
  String name = '';
  void initState() {
    super.initState();
    getName();
  }

  void dispose() {
    super.dispose();
  }

  Future<void> getName() async {
    try {
      name = await storage.read(key: 'name');
    } catch (e) {
      print(e);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                print('Hello');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit,
                  color: kOtherColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                 await storage.delete(key: "token");
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  Login()), (route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.exit_to_app,
                  color: kOtherColor,
                ),
              ),
            )
          ],
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Profile',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  // color: kAccent
                  ),
              // image: DecorationImage(
              //     image: NetworkImage("add you image URL here "),
              //     fit: BoxFit.cover)),
              child: Container(
                width: double.infinity,
                height: 150,
                child: Container(
                  alignment: Alignment(0.0, 0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/564x/ee/67/b7/ee67b75304bc826fa4150e8043dc3645.jpg"),
                    radius: 60.0,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    name != null ? name.toString() : '',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueGrey,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Noida, India",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "App Developer at XYZ Company",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    " Junior Developer",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
