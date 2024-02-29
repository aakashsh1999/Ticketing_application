import 'dart:async';
import 'package:cloudstok_ticketing/constants/colors.dart';
import 'package:cloudstok_ticketing/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTextField extends StatelessWidget {
  String hintText;
  TextInputType type;
  dynamic errorText;
  TextEditingController controller;
  LoginTextField({
    Key? key,
    required this.hintText,
    required this.type,
    required this.errorText,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool vis = true;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: type,
        obscureText: type == TextInputType.visiblePassword && vis,
        controller: controller,
        decoration: InputDecoration(
            labelText: hintText,
            errorText: errorText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}

class CardText extends StatelessWidget {
  String title;
  int number;
  final Color color;

  CardText(
      {Key? key,
      required this.title,
      required this.number,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 18, color: color),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            number.toString(),
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class TicketFields extends StatelessWidget {
  String title;
  String hintText;
  TicketFields({
    Key? key,
    required this.hintText,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title.toUpperCase(),
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                labelText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class UserListTile extends StatelessWidget {
  final String value;
  UserListTile({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          leading: Container(
            width: 70,
            height: 70,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.w3schools.com/howto/img_avatar.png"),
            ),
          ),
          title: Text(
            'Aakash'.toUpperCase(),
            style: GoogleFonts.lato(fontSize: 16),
          ),
          subtitle: Text(
            'This is item $value',
            style: GoogleFonts.lato(fontSize: 12),
          ),
        ),
      ),
    );
  }
}

class TicketContainer extends StatelessWidget {
  final int ticketId;
  final String description;
  final String date;
  final int accountId;
  final int userId;
  final int assignedUserId;
  TicketContainer(
      {Key? key,
      required this.ticketId,
      required this.accountId,
      required this.assignedUserId,
      required this.date,
      required this.description,
      required this.userId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(children: [
                            Text('Ticket ID: ',
                                style: GoogleFonts.lato(
                                    fontSize: 16, fontWeight: FontWeight.w700)),
                            Text(ticketId.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey))
                          ]),
                          SizedBox(height: 15),
                          Text(description.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(date.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey))
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Account ID'.toUpperCase(),
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text(accountId.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('User ID'.toUpperCase(),
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text(userId.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green)),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Assigned User ID'.toUpperCase(),
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(assignedUserId.toString(),
                                    style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green)),
                                SizedBox(
                                  height: 10,
                                )
                              ])
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class AccountListTile extends StatelessWidget {
  final int id;
  String date;
  final String name;
  final int ownerUserId;
  final int status;
  AccountListTile(
      {Key? key,
      required this.id,
      required this.date,
      required this.name,
      required this.ownerUserId,
      required this.status})
      : super(key: key);


    String getFinalDate(String date){
    List monthUs = months;
     DateTime value;
        value = DateTime.parse(date.split('T')[0]);
        print(value.day);
      return (value.day.toString() +" "+monthUs[value.month-1].toUpperCase() +" "+value.year.toString());
    }


  @override
  Widget build(BuildContext context) {
    print(id);
    print(name);
    print(ownerUserId);
    print(status);
    print(date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text('ID: ',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w700)),
                            Text(id.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey))
                          ]),
                          SizedBox(height: 15),
                          Row(children: [
                            Text('Name: ',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w700)),
                            Text(name.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey))
                          ]),
                          SizedBox(
                            height: 15,
                          ),
                          Row(children: [
                            Text('Owner\'s User ID: ',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.w700)),
                            Text(ownerUserId.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey))
                          ]),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(getFinalDate(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Chip(
                              label: Text(
                                status == 1 ? 'Active' : 'Inactive',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor:
                                  status == 1 ? Colors.green : Colors.red)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
