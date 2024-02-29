import 'package:cloudstok_ticketing/config/NetworkHandler.dart';
import 'package:cloudstok_ticketing/constants/colors.dart';
import 'package:cloudstok_ticketing/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final networkHandler = NetworkHandler();
  bool progress = true;
  var response;
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    response = await networkHandler.get('getuser');
     print(response);
    if (response == null) {
      response = 'Data not found';
      progress = false;
    } else {
      response = await response['result'];
      progress = false;
    }
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
              'Users',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 20,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: (progress != true) ? Container(
                color: kbackgroundColor,
                child: response.runtimeType != String 
                 ? ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return UserListTile(value: (index + 1).toString());
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
