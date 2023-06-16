import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:room_booking_system/home.dart';
import 'package:room_booking_system/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:room_booking_system/room_usage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(new MaterialApp(home: new UserFeedback()));
}

class UserFeedback extends StatefulWidget {
  const UserFeedback({Key? key}) : super(key: key);

  @override
  State<UserFeedback> createState() => _UserFeedback();
}

class _UserFeedback extends State<UserFeedback> {
  // final String uid = FirebaseAuth.instance.currentUser?.uid as String;
  static String uid = '1';
  // final String roomId = FirebaseAuth.instance.Room.roo as String;
  final DatabaseReference database =
      FirebaseDatabase.instance.ref("Feedback/$uid");

  // TextEditingController guestController = TextEditingController();
  final _controllerFbName = TextEditingController();
  final _controllerFbDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffcfcfc),
        appBar: AppBar(
          title: const Text("Feedback"),
          titleTextStyle: const TextStyle(
            color: Color(0xff161618),
            fontSize: 20,
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
        body: ListView(children: <Widget>[
          _imgCard(context),
          SizedBox(height: 20),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50,
                    width: 400,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Name', border: OutlineInputBorder()),
                        controller: _controllerFbName),
                  ),
                )
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 300,
                    width: 400,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Type your feedback here...',
                            border: OutlineInputBorder()),
                        maxLines: 100,
                        controller: _controllerFbDesc),
                  ),
                )
              ],
            ),
          ),
        ]),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: FloatingActionButton(
                foregroundColor: Color(0xffFFFAF2),
                backgroundColor: Color(0xffffad27),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Color(0xffffad27))),
                onPressed: () async {
                  try {
                    await database.push().update({
                      // 'userID': uid,
                      'feedbackName': _controllerFbName.text,
                      'feedbackDescription': _controllerFbDesc.text,
                    });
                  } catch (e) {
                    print('You got an error! $e');
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RoomUsage()));
                },
                child: const Text(
                  "Submit Feedback",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))));
  }
}

Card _imgCard(BuildContext context) {
  return Card(
    elevation: 4.0,
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
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
            top: 10,
            left: 20,
            right: 10,
            bottom: 10,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bilik Seminar M01"),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Room Capacity : 120 pax",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ]),
        )),
      ],
    ),
  );
}
