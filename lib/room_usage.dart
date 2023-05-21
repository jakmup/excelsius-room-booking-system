import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:room_booking_system/room_usage_detail.dart';
import 'package:room_booking_system/start_apps.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(new MaterialApp(home: new RoomUsage()));
}

class RoomUsage extends StatefulWidget {
  const RoomUsage({Key? key}) : super(key: key);

  @override
  State<RoomUsage> createState() => _RoomUsage();
}

class _RoomUsage extends State<RoomUsage> {
  static String uid = '1';
  final Query database = FirebaseDatabase.instance.ref("Booking/$uid");
  // final snapshot = database.get();

  int _selectedIndex = 1;

  Widget bookingList({required Map booking}) {
    return Container(
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RoomUsageDetail()));
          },
          child: SizedBox(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
              leading: Image(
                image: AssetImage('assets/images/room1.png'),
              ),
              title:
                  Text(booking['roomName'] + ' - ' + booking['roomLocation']),
              subtitle: Text(
                '${booking['fromDate']} ${booking['fromTime']} - ${booking['toDate']} ${booking['toTime']}',
              ),
            ),
          ),
        ),
      ),
    );
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: AppBar(
        title: const Text("Room Usage"),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // Use a Material design search bar
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            // height: double.infinity,
            // children: <Widget>[
            child: FirebaseAnimatedList(
              query: database,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map booking = snapshot.value as Map;
                booking['key'] = snapshot.key;
                return bookingList(booking: booking);
              },
            ),
            // ],
          )
        ],
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
              icon: Icon(Icons.note, color: Colors.black), label: "Booking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Colors.black), label: "Payment"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert), label: "Notification"),
        ],
        selectedItemColor: Colors.amber[800]);
  }
}
