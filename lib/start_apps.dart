import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:room_booking_system/login.dart';
import 'package:room_booking_system/reusable_widgets/reusable_widget.dart';
import 'package:room_booking_system/signup.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  @override
  _Start createState() => _Start();
}

class _Start extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Image1.png'), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            20, MediaQuery.of(context).size.height * 0.2, 20, 100),
        child: Column(children: <Widget>[
          logoWidget("assets/images/logo.png"),
          const SizedBox(height: 40),
          loginButton(context),
          signUpButton(context),
        ]),
      ),
    ));
  }
}

Widget loginButton(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      color: Color.fromRGBO(255, 153, 0, 1),
    ),
    width: MediaQuery.of(context).size.width,
    height: 35,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    alignment: Alignment.bottomCenter,
    child: TextButton(
      child: const Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login())),
    ),
  );
}

Widget signUpButton(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      color: Color.fromRGBO(255, 153, 0, 1),
    ),
    width: MediaQuery.of(context).size.width,
    height: 35,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    alignment: Alignment.bottomCenter,
    child: TextButton(
      child: const Text(
        "Sign Up",
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUp())),
    ),
  );
}
