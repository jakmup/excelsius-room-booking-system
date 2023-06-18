import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:room_booking_system/room_usage.dart';
import 'package:room_booking_system/payment_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(home: PaymentPage()));
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

enum PaymentType { Online, Card }

class _PaymentPageState extends State<PaymentPage> {
  PaymentType _selectedPaymentType = PaymentType.Online;

  Widget buildOnlinePaymentWidget() {
    return Column(
      children: [
        RadioListTile<PaymentType>(
          title: const Text('Online Payment'),
          value: PaymentType.Online,
          groupValue: _selectedPaymentType,
          onChanged: (PaymentType? value) {
            setState(() {
              _selectedPaymentType = value!;
            });
          },
        ),
        if (_selectedPaymentType == PaymentType.Online)
          Image(
            image: AssetImage('assets/images/fpx-logo.jpg'),
          ),
      ],
    );
  }

  Widget buildCardPaymentWidget() {
    return Column(
      children: [
        RadioListTile<PaymentType>(
          title: const Text('Card Payment'),
          value: PaymentType.Card,
          groupValue: _selectedPaymentType,
          onChanged: (PaymentType? value) {
            setState(() {
              _selectedPaymentType = value!;
            });
          },
        ),
        if (_selectedPaymentType == PaymentType.Card)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Card Number'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Expiry Date'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'CVV'),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // @override
  //Widget build(BuildContext context) {
  // // TODO: implement build
  // throw UnimplementedError();
  // }

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

  late Widget paymentTypeWidget;

  @override
  void initState() {
    super.initState();
    _initialDateFrom = DateTime.now().add(const Duration(days: 1));
    //paymentTypeWidget = buildOnlinePaymentWidget();
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
                  title: const Text('RM 120'),
                  subtitle: const Text('One Hundred and Twenty Ringgit'),
                ),
              ),
            ),
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
                                    Text('RM120', style: TextStyle(height: 2)))
                          ]),
                      Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Total Payment:',
                                style: TextStyle(height: 2))),
                        Padding(
                            padding: EdgeInsets.fromLTRB(140, 0, 0, 0),
                            child: Text('RM120', style: TextStyle(height: 2)))
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
                  "Pay",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))));
  }
}
