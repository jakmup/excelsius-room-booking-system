import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
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

  runApp(new MaterialApp(home: new Booking()));
}

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  // final String uid = FirebaseAuth.instance.currentUser?.uid as String;
  static String uid = '1';
  // final String roomId = FirebaseAuth.instance.Room.roo as String;
  final DatabaseReference database =
      FirebaseDatabase.instance.ref("Booking/$uid");

  // TextEditingController guestController = TextEditingController();
  final guestController = TextEditingController(text: '0');

  late DateTime _initialDateFrom;
  late DateTime _initialDateTo;
  // late DateTime tf = ;
  late String fromDateBtnText = 'Select Date';
  // late TimeOfDay fromTimeBtnText = TimeOfDay.now();
  late TimeOfDay fromTimeBtnText = TimeOfDay.now();
  late String toDateBtnText = 'Select Date';
  late TimeOfDay toTimeBtnText = TimeOfDay.now();

  // static const DropdownMenuItem<List<String>> paymentType? = DropdownMenuItem<List<T>>['Online Banking', 'Credit/Debit Card'];

  late String paymentTypeValue = 'Online Payment';

  @override
  void initState() {
    super.initState();
    _initialDateFrom = DateTime.now().add(const Duration(days: 1));
  }

  Future<void> _selectDateFrom() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _initialDateFrom,
      firstDate: _initialDateFrom,
      lastDate: DateTime(2050),
    );
    if (newDate != null) {
      setState(() {
        _initialDateFrom = newDate;
        _initialDateTo = newDate;
        fromDateBtnText =
            "${_initialDateFrom.day}/${_initialDateFrom.month}/${_initialDateFrom.year}";
      });
    }
  }

  Future<void> _selectTimeFrom() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null) {
      newTime.toString();
      setState(() {
        fromTimeBtnText = newTime;
      });
    }
  }

  Future<void> _selectDateTo() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _initialDateTo,
      firstDate: _initialDateTo,
      lastDate: DateTime(2050),
    );
    if (newDate != null) {
      setState(() {
        _initialDateTo = newDate;
        toDateBtnText =
            "${_initialDateTo.day}/${_initialDateTo.month}/${_initialDateTo.year}";
      });
    }
  }

  Future<void> _selectTimeTo() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null) {
      newTime.toString();
      setState(() {
        toTimeBtnText = newTime;
      });
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    final String hour = time.hourOfPeriod.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffcfcfc),
        appBar: AppBar(
          title: const Text("Checkout"),
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
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    title: const Text('Bilik Seminar'),
                    subtitle: const Text('M01, Kolej Tun Dr Ismail'),
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  title: const Text('Non-refundable'),
                  subtitle: const Text(
                      'You cannot refund your payment when you cancel booking'),
                ),
              ),
            ),
            Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('From'),
                      ElevatedButton(
                          style: ButtonStyle(
                              side:
                                  MaterialStateProperty.resolveWith<BorderSide>(
                                      (states) =>
                                          BorderSide(color: Color(0xffffad27))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) => Color(0xffFFFAF2)),
                              shape: MaterialStateProperty.resolveWith<
                                  OutlinedBorder>((_) {
                                return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8));
                              }),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffffad27))),
                          onPressed: _selectDateFrom,
                          child: Text(fromDateBtnText)),
                      ElevatedButton(
                          style: ButtonStyle(
                              side:
                                  MaterialStateProperty.resolveWith<BorderSide>(
                                      (states) =>
                                          BorderSide(color: Color(0xffffad27))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) => Color(0xffFFFAF2)),
                              shape: MaterialStateProperty.resolveWith<
                                  OutlinedBorder>((_) {
                                return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8));
                              }),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffffad27))),
                          onPressed: _selectTimeFrom,
                          child: Text(fromTimeBtnText.format(context)))
                    ],
                  ),
                )),
            Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('To'),
                      ElevatedButton(
                          style: ButtonStyle(
                              side:
                                  MaterialStateProperty.resolveWith<BorderSide>(
                                      (states) =>
                                          BorderSide(color: Color(0xffffad27))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) => Color(0xffFFFAF2)),
                              shape: MaterialStateProperty.resolveWith<
                                  OutlinedBorder>((_) {
                                return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8));
                              }),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffffad27))),
                          onPressed: _selectDateTo,
                          child: Text(toDateBtnText)),
                      ElevatedButton(
                          style: ButtonStyle(
                              side:
                                  MaterialStateProperty.resolveWith<BorderSide>(
                                      (states) =>
                                          BorderSide(color: Color(0xffffad27))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) => Color(0xffFFFAF2)),
                              shape: MaterialStateProperty.resolveWith<
                                  OutlinedBorder>((_) {
                                return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8));
                              }),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xffffad27))),
                          onPressed: _selectTimeTo,
                          child: Text(toTimeBtnText.format(context)))
                    ],
                  ),
                )),
            Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 50,
                  // width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Total Guests'),
                      Center(
                        child: SizedBox(
                          height: 35,
                          width: 70,
                          child: TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              controller: guestController),
                        ),
                      )
                    ],
                  ),
                )),
            Card(
                color: Color(0xffFFFAF2),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffffad27)),
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Payment Method:',
                            style: TextStyle(
                                color: Color(0xffffad27),
                                fontWeight: FontWeight.bold),
                          )),
                      Center(
                          child: SizedBox(
                              height: 35,
                              width: 150,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  focusColor: Color(0xffFFFAF2),
                                  style: TextStyle(
                                      color: Color(0xffffad27),
                                      fontWeight: FontWeight.bold),
                                  // borderRadius: ,
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text('Online Payment'),
                                      value: 'Online Payment',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Debit/Credit Card'),
                                      value: 'Card',
                                    )
                                  ],
                                  value: paymentTypeValue,
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      paymentTypeValue = value!;
                                    });
                                  },
                                ),
                              )))
                    ],
                  ),
                )),
            Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 130,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      Row(children: const <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Payment Summary:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, height: 2),
                            ))
                      ]),
                      Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text('Subtotal:',
                                    style: TextStyle(height: 2))),
                            Padding(
                                padding: EdgeInsets.fromLTRB(176, 0, 0, 0),
                                // padding: EdgeInsets.symmetric(horizontal: 175),
                                child:
                                    Text('RM350', style: TextStyle(height: 2)))
                          ]),
                      Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Total Payment:',
                                style: TextStyle(height: 2))),
                        Padding(
                            padding: EdgeInsets.fromLTRB(140, 0, 0, 0),
                            child: Text('RM350', style: TextStyle(height: 2)))
                      ]),
                    ],
                  ),
                ))
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
                  final String fromTimeString =
                      formatTimeOfDay(fromTimeBtnText);
                  final String toTimeString = formatTimeOfDay(toTimeBtnText);
                  try {
                    await database.push().update({
                      // 'userID': uid,
                      'roomID': 1,
                      'roomName': 'Bilik Seminar',
                      'roomLocation': 'M01, Kolej Tun Dr Ismail',
                      'capacity': guestController.text,
                      'fromDate': fromDateBtnText,
                      'fromTime': fromTimeString,
                      'toDate': toDateBtnText,
                      'toTime': toTimeString,
                      'status': 'Pending Approval',
                      'paymentMethod': paymentTypeValue
                    });
                  } catch (e) {
                    print('You got an error! $e');
                    print('Capacity: ${guestController.text}');
                    print('fromDate: ${fromDateBtnText}');
                    print('fromTime: ${fromTimeString}');
                    print('toDate: ${toDateBtnText}');
                    print('toTime: ${toTimeString}');
                    print('paymentMethod: ${paymentTypeValue}');
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RoomUsage()));
                },
                child: const Text(
                  "Proceed With Payment",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))));
  }
}
