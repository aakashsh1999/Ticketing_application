import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = FlutterSecureStorage();
  String name= '';
  void initState(){
    super.initState();
    getName();
  }

  void dispose(){
    super.dispose();
  }


Future<void> getName() async {
    try{
      name = await storage.read(key: 'name');
    }
    catch (e){
      print(e);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Text(
                'Hello',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                width: 4,
              ),
              Text( name.toString(),
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    text: TextSpan(
                  text: 'Daily Tickets',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    'No. of tickets',
                                    style: GoogleFonts.poppins(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '32',
                                    style: GoogleFonts.poppins(fontSize: 120),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CardText(
                                number: 32,
                                title: 'Resolved',
                                color: Colors.red,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CardText(
                                number: 32,
                                title: 'Open',
                                color: Colors.green,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CardText(
                                number: 50,
                                title: 'SLA (%)',
                                color: Colors.blue,
                              ),
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: FlatButton(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20)),
          //     height: 40,
          //     color: Colors.blue,
          //     minWidth: MediaQuery.of(context).size.width,
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/create');
          //     },
          //     child: Container(
          //       child: Text(
          //         'GET YOUR TICKET',
          //         style: GoogleFonts.poppins(
          //             color: Colors.white,
          //             fontWeight: FontWeight.w600,
          //             fontSize: 16),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
