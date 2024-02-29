import 'package:flutter/material.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTicket extends StatefulWidget {
  const CreateTicket({Key? key}) : super(key: key);

  @override
  _CreateTicketState createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
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
        body: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RichText(
                              text: TextSpan(
                                  text: 'Create Your Ticket',
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
                          child: Text('Enter your details to get your ticket.',
                              style: GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 14)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TicketFields(
                      title: 'First Name*',
                      hintText: 'Enter your first name',
                    ),
                    TicketFields(
                      title: 'Last Name*',
                      hintText: 'Enter your last name',
                    ),
                    TicketFields(
                      title: 'Designation*',
                      hintText: 'Enter your designation',
                    ),
                    TicketFields(
                      title: 'Company Name*',
                      hintText: 'Enter your company name',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {},
                        child: Text('Submit'.toUpperCase(), style: GoogleFonts.poppins(color:Colors.white, fontSize:18, fontWeight: FontWeight.w600),),
                        color: Colors.blue,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
