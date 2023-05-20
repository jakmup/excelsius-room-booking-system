import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:room_booking_system/reusable_widgets/reusable_widget.dart';
import 'package:room_booking_system/start_apps.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            TextField(
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  hintText: "Search a room here",
                  suffixIcon: Icon(Icons.search),
                )),
            SizedBox(height: 20),
            _buildCard(),
            _buildCard(),
            _buildCard(),
            _buildCard(),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
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
              icon: Icon(Icons.note, color: Colors.black), label: "Note"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Colors.black), label: "Payment"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert), label: "Notification"),
        ],
        selectedItemColor: Colors.amber[800]);
  }
}

Card _buildCard() {
  return Card(
      elevation: 4.0,
      child: Row(
        children: [
          Container(
              child: Image(
            fit: BoxFit.fitHeight,
            height: 100,
            width: 100,
            alignment: Alignment.topLeft,
            image: AssetImage("assets/images/UTMbilikSeminar.jpg"),
          )),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 10,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bilik Seminar M01"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 15,
                  ),
                  Text(
                    "M01, Kolej Tun Dr. Ismail",
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Room Capacity : 120 pax",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              )
            ]),
          ))
        ],
      ));
}
