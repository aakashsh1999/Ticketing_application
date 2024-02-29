import 'dart:ffi';

import 'package:cloudstok_ticketing/config/NetworkHandler.dart';
import 'package:cloudstok_ticketing/constants/colors.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final networkHandler = NetworkHandler();
  bool progress = true;
  var response;
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    response = await networkHandler.get('a_select');
    print(response);
    if (response == null) {
      response = 'Data not found';
      progress = false;
    } else {
      response = await response['result'];
      progress = false;
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
            child: Text(
              'Accounts',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: (progress != true)
            ? Container(
                color: kbackgroundColor,
                child: response != []
                    ? ListView.builder(
                        itemCount: response.length,
                        itemBuilder: (context, index) {
                          return AccountListTile(
                              id: response[index]['acc_id'],
                              name: response[index]['name'],
                              date: response[index]['ms_start_date'],
                              status: response[index]["is_active"],
                              ownerUserId: response[index]['owner_user_id']);
                        })
                    : Center(
                        child: Text(response.toString()),
                      ),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.red[400],
                ),
              ));
  }
}
