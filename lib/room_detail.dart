import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:room_booking_system/reusable_widgets/reusable_widget.dart';
import 'package:room_booking_system/start_apps.dart';
import 'package:room_booking_system/home.dart';

void main() {
  runApp(const roomDetail());
}

class roomDetail extends StatefulWidget {
  const roomDetail({super.key});

  @override
  _roomDetail createState() => _roomDetail();
}

class _roomDetail extends State<roomDetail> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.orange)),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
                image: DecorationImage(
                    image: AssetImage('assets/images/Image1.png'),
                    fit: BoxFit.cover),
              ),
              child: Text('uniroom'),
            ),
            ListTile(
              leading: Icon(
                Icons.people,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: const Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Start()));
                });
              },
            ),
          ],
        ),
      ),
      body: roomInfo(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Container roomInfo() {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/UTMbilikSeminar.jpg"),
              fit: BoxFit.fill),
        ),
        child: Column(children: [
          Expanded(
            child: Container(),
          ),
          Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white.withOpacity(0.8),
              ),
              child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                SizedBox(height: 40),
                ListTile(
                  title: Text('Bilik Seminar M01'),
                  subtitle: Text(
                      "\n\nRoom capacity 120 people, equipped with WIFI.  \nInclude  \n - LCD Projector\n - Projector Screen\n - Microphone\n - PA system \n - Computer\n\n"),
                ),
                SizedBox(height: 40),
                submitButton(context, "Book Room", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                })
              ]))
        ]));
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note, color: Colors.black), label: "Booking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Colors.black), label: "Payment"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert), label: "Notification"),
        ],
        selectedItemColor: Colors.amber[800]);
  }
}
