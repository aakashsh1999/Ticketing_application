import 'package:cloudstok_ticketing/config/NetworkHandler.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketPage extends StatefulWidget {
  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final networkHandler = NetworkHandler();
  var response;
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    response = await networkHandler.get('t_display');
    response = await response['result'];
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Tickets',
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 20,
              // fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body:response != null ? ListView.builder(
        itemCount: response.length,
        itemBuilder: (context, index) {
        return TicketContainer(userId: response[index]['user_id'], accountId: response[index]['account_id'], date: '', assignedUserId: response[index]['assigned_user_id'], description: response[index]['description'], ticketId: response[index]['ticket_id'] );
      }): Center(
        child: CircularProgressIndicator(
          color: Colors.red[400],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create');
          },
          child: Icon(Icons.add)),
    );
  }
}
