import 'dart:ffi';

import 'package:cloudstok_ticketing/modules/screens/change_password.dart';
import 'package:cloudstok_ticketing/modules/screens/create_ticket.dart';
import 'package:cloudstok_ticketing/modules/screens/forget.dart';
import 'package:cloudstok_ticketing/modules/screens/login.dart';
import 'package:cloudstok_ticketing/modules/screens/pages/loading.dart';
import 'package:cloudstok_ticketing/modules/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './home.dart';
import 'modules/screens/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 Widget page = LoadingPage();
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        page = MyHomePage();
      });
    } else {
      setState(() {
        page = Login();
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloudstok Ticketing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: page,
      // onGenerateRoute: generateRoute,
    );
  }
}

// Route<dynamic> generateRoute(RouteSettings routeSettings) {
//   final args = routeSettings.arguments;

//   switch (routeSettings.name) {
//     case '/':
//       return MaterialPageRoute(
//         builder: (context) => Login(),
//       );
//     case '/dashboard':
//       return MaterialPageRoute(
//           builder: (context) => MyHomePage(title: 'Dashboard'));

//     case '/signup':
//       return MaterialPageRoute(builder: (context) => SignUp());

//     case '/forget':
//       return MaterialPageRoute(builder: (context) => ForgetScreen());

//     case '/create':
//       return MaterialPageRoute(builder: (context) => CreateTicket());

//     case '/changePassword':
//       return MaterialPageRoute(builder: (context) => ChangePassword());

//     default:
//       return MaterialPageRoute(
//         builder: (context) => Login(),
//       );
//   }
// }
