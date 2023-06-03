import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(new MaterialApp(home: new UpdateRoom()));
}

class UpdateRoom extends StatefulWidget {
  const UpdateRoom({Key? key}) : super(key: key);

  @override
  State<UpdateRoom> createState() => _UpdateRoomState();
}

class _UpdateRoomState extends State<UpdateRoom> {
  // final String uid = FirebaseAuth.instance.currentUser?.uid as String;
  static String uid = '1';
  static String roomID = '1';
  final DatabaseReference database = FirebaseDatabase.instance.ref("Room/$uid/$roomID");

  final _controllerName = TextEditingController();
  final _controllerLocation = TextEditingController();
  final _controllerDescription = TextEditingController();
  final _controllerPrice = TextEditingController();

  // toggle initialization
  late String _statusRoom = 'close';
  final List<bool> _status = <bool>[true, false];
  bool vertical = false;

  late double _distanceToField;
  late TextfieldTagsController _controllerAmenities;
  List<String> tags = [];

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [],
              ),
            ),
          );
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controllerAmenities.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllerAmenities = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/UTMbilikSeminar.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
          body: ListView(
            padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Text(
                            'Update Room',
                            style: TextStyle(
                              color: Color(0xff161618),
                              fontSize: 24,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (states) => Color(0XFFFDF3F3),
                          ),
                          shape:
                              MaterialStateProperty.resolveWith<OutlinedBorder>(
                                  (_) {
                            return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                    color: Color(0xffE13737),
                                    style: BorderStyle.solid,
                                    width: 1.5));
                          }),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffE13737)),
                        ),
                      ))
                ],
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: Text("Room Name",
                            style: TextStyle(
                              color: Color(0xff161618),
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: SizedBox(
                            height: 30,
                            width: 150,
                            child: TextField(
                              style: TextStyle(
                                color: Color(0xff161618),
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                              controller: _controllerName,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                border: OutlineInputBorder(),
                              ),
                            )))
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: Text("Location",
                            style: TextStyle(
                              color: Color(0xff161618),
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: SizedBox(
                            height: 30,
                            width: 250,
                            child: TextField(
                              style: TextStyle(
                                color: Color(0xff161618),
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                              controller: _controllerLocation,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                border: OutlineInputBorder(),
                              ),
                            )))
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: Text("Description",
                            style: TextStyle(
                              color: Color(0xff161618),
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: SizedBox(
                            height: 30,
                            // width: 150,
                            child: TextField(
                              style: TextStyle(
                                color: Color(0xff161618),
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                              controller: _controllerDescription,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                border: OutlineInputBorder(),
                              ),
                            )))
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: Text("Status",
                            style: TextStyle(
                              color: Color(0xff161618),
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: SizedBox(
                          height: 30,
                          width: 250,
                          child: ToggleButtons(
                            direction:
                                vertical ? Axis.vertical : Axis.horizontal,
                            onPressed: (int index) {
                              setState(() {
                                // The button that is tapped is set to true, and the others to false.
                                for (int i = 0; i < _status.length; i++) {
                                  _status[i] = i == index;
                                }
                              });
                            },
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            selectedBorderColor: Color(0xffffad27),
                            selectedColor: Color(0xffffad27),
                            fillColor: Color(0XFFFFFAF3),
                            color: Color(0xffffad27),
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 60.0,
                            ),
                            isSelected: _status,
                            children: <Widget>[
                              Text('Open',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text('Closed',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ))
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: Text("Room Price",
                            style: TextStyle(
                              color: Color(0xff161618),
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: SizedBox(
                            height: 30,
                            width: 150,
                            child: TextField(
                              style: TextStyle(
                                color: Color(0xff161618),
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                              controller: _controllerPrice,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                border: OutlineInputBorder(),
                              ),
                            )))
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                        child: Text("Amenities",
                            style: TextStyle(
                              color: Color(0xff161618),
                              fontSize: 12,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ))),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFieldTags(
                        textfieldTagsController: _controllerAmenities,
                        textSeparators: const [','],
                        letterCase: LetterCase.normal,
                        inputfieldBuilder:
                            (context, tec, fn, error, onChanged, onSubmitted) {
                          return ((context, sc, tags, onTagDelete) {
                            return TextField(
                              style: TextStyle(fontSize: 12),
                              controller: tec,
                              focusNode: fn,
                              decoration: InputDecoration(
                                isDense: true,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 136, 17),
                                    width: 3.0,
                                  ),
                                ),
                                helperText: 'Seperate by comma (,)',
                                helperStyle: const TextStyle(
                                  color: Color.fromARGB(255, 255, 136, 17),
                                ),
                                hintText: _controllerAmenities.hasTags
                                    ? ''
                                    : "Enter Amenities",
                                errorText: error,
                                prefixIconConstraints: BoxConstraints(
                                    maxWidth: _distanceToField * 0.74),
                                prefixIcon: tags.isNotEmpty
                                    ? SingleChildScrollView(
                                        controller: sc,
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            children: tags.map((String tag) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffffad27)),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                              color: Color(0XFFFFFAF3),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  child: Text(
                                                    '$tag',
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xffffad27),
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                const SizedBox(width: 4.0),
                                                InkWell(
                                                  child: const Icon(
                                                    Icons.cancel,
                                                    size: 14.0,
                                                    color: Color.fromARGB(
                                                        255, 233, 233, 233),
                                                  ),
                                                  onTap: () {
                                                    onTagDelete(tag);
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        }).toList()),
                                      )
                                    : null,
                              ),
                              onChanged: onChanged,
                              onSubmitted: onSubmitted,
                            );
                          });
                        },
                      ),
                    )
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: SizedBox(
                          height: 30,
                          width: 60,
                          // child: TextField(
                          //   style: TextStyle(
                          //     color: Color(0xff161618),
                          //     fontSize: 12,
                          //     fontFamily: "Poppins",
                          //     fontWeight: FontWeight.w500,
                          //   ),
                          //   controller: _controllerPrice,
                          //   decoration: InputDecoration(
                          //     contentPadding: EdgeInsets.symmetric(
                          //         horizontal: 15, vertical: 5),
                          //     border: OutlineInputBorder(),
                          //   ),
                          // )
                        ))
                  ]),
            ],
          ),
          bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: FloatingActionButton(
                  foregroundColor: Color(0xffFFFAF2),
                  backgroundColor: Color(0xffffad27),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Color(0xffffad27))),
                  onPressed: () async {
                    if (_status[0])
                      _statusRoom = 'open';
                    else if (_status[1]) _statusRoom = 'close';
                    try {
                      await database.update({
                        // 'userID': uid,
                        'roomName': _controllerName.text,
                        'roomDescription': _controllerDescription.text,
                        'roomLocation': _controllerLocation.text,
                        'status': _statusRoom,
                        'roomPrice': _controllerPrice.text,
                        'amenities': _controllerAmenities.getTags.toString(),
                      });
                    } catch (e) {
                      print('Failed to update document! $e');
                      // print('Capacity: ${guestController.text}');
                      // print('fromDate: ${fromDateBtnText}');
                      // print('fromTime: ${fromTimeString}');
                      // print('toDate: ${toDateBtnText}');
                      // print('toTime: ${toTimeString}');
                      // print('paymentMethod: ${paymentTypeValue}');
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => RoomUsage()));
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )))),
    );
  }
}
