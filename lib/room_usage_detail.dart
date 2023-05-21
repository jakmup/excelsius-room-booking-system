import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(new MaterialApp(home: new RoomUsageDetail()));
  // runApp(new MaterialApp(home: new RoomUsageDetail(bookingID: '')));
}

class RoomUsageDetail extends StatefulWidget {
  // RoomUsageDetail({Key? key, required this.bookingID}) : super(key: key);
  const RoomUsageDetail({Key? key}) : super(key: key);
  // final String bookingID;
  @override
  State<RoomUsageDetail> createState() => _RoomUsageDetail();
}

class _RoomUsageDetail extends State<RoomUsageDetail> {
  // final String uid = FirebaseAuth.instance.currentUser?.uid as String;
  final String uid = '1';
  // late final String bookingID = widget.bookingID;
  // late DatabaseReference database =
  // FirebaseDatabase.instance.ref().child("Booking/$uid/$bookingID");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: AppBar(
        title: const Text("Room Usage Detail"),
        titleTextStyle: const TextStyle(
          color: Color(0xff161618),
          fontSize: 14,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: const Color(0XFFFCFCFC),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff161618),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  leading: Image(
                    image: AssetImage('assets/images/room1.png'),
                  ),
                  // title: Text(bookingID),
                  title: Text('Bilik Seminar'),
                  subtitle: const Text('M01, Kolej Tun Dr Ismail'),
                ),
              ),
            ),
          ),
          Center(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  title: const Text('Status'),
                  subtitle: const Text('Pending Approval'),
                ),
              ),
            ),
          ),
          Center(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  title: const Text('Capacity'),
                  subtitle: const Text('100'),
                ),
              ),
            ),
          ),
          Center(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  title: const Text('Booking Date'),
                  subtitle: const Text('22-05-2023'),
                ),
              ),
            ),
          ),
          Center(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  title: const Text('Booking Time'),
                  subtitle: const Text('1:00 PM - 4.00 PM'),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar:
    );
  }
}
