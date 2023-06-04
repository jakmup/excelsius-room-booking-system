import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:room_booking_system/update_room.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(new MaterialApp(home: new RoomListDetail()));
}

class RoomListDetail extends StatefulWidget {
  const RoomListDetail({Key? key}) : super(key: key);

  @override
  State<RoomListDetail> createState() => _RoomListDetail();
}

class _RoomListDetail extends State<RoomListDetail> {
  static String uid = '1';
  static String roomID = '1';
  final Query database = FirebaseDatabase.instance.ref("Room");
  // final snapshot = database.get();

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    database.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;

      // Read the values of all the children
      String roomName = snapshot.child("roomName").value as String;
      String roomDescription =
          snapshot.child("roomDescription").value as String;
      String roomLocation = snapshot.child("roomLocation").value as String;
      String status = snapshot.child("status").value as String;
      String roomPrice = snapshot.child("roomPrice").value as String;
    });
  }

  Widget roomList({required Map room}) {
    return Container(
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          SizedBox(height: 40),
          ListTile(
            title: Text('Description'),
            subtitle: Text(
              '${room['Description']} ${room['Status']} - ${room['Room Price']} ${room['Include']}',
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.orange),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/UTMbilikSeminar.jpg"),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bilik Seminar M01",
                          style: (TextStyle(color: Colors.white, shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              // color of the shadow
                              color: Colors.black,
                              offset: Offset(2, 2),
                            ),
                            // color and font size of the text
                          ]))),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text("M01, Kolej Tun Dr. Ismail",
                          style: (TextStyle(color: Colors.white, shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              // color of the shadow
                              color: Colors.black,
                              offset: Offset(2, 2),
                            ),
                            // color and font size of the text
                          ])))
                    ],
                  )),
              Expanded(
                // height: double.infinity,
                // children: <Widget>[
                child: FirebaseAnimatedList(
                  query: database,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Map room = snapshot.value as Map;
                    room['key'] = snapshot.key;
                    return roomList(room: room);
                  },
                ),
                // ],
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        width: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.red,
                            side: BorderSide(width: 3, color: Colors.red),
                          ),
                          onPressed: () {
                            _showDialogDelete({required Map room}) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    title: const Text("Are you sure?"),
                                    content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: const Text(
                                                "Are you sure you want to continue?\n\n"),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    onPrimary: Colors.red,
                                                    side: BorderSide(
                                                        width: 3,
                                                        color: Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("No"),
                                                ),
                                                Text("   "),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    // ref
                                                    //     .child(room['key'])
                                                    //     .remove();
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          scrollable: true,
                                                          content: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              children: [
                                                                Card(
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        "images/deleted.png"),
                                                                    height: 90,
                                                                    width: 90,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                      "\nRoom deleted successfully.\n"),
                                                                ),
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .orange,
                                                                    onPrimary:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  child: const Text(
                                                                      "Return"),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.popUntil(
                                                                        context,
                                                                        (route) =>
                                                                            route.isFirst);
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text("Yes"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Text("Delete"),
                        ),
                      ),
                    ),
                    Text("   "),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        width: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateRoom()));
                          },
                          child: Text("Update"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
