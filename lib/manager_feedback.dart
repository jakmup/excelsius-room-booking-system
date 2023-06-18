// ignore_for_file: use_function_type_syntax_for_parameters
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Query dbref = FirebaseDatabase.instance.ref().child('Feedback');

  Widget ListItem({required Map feedback}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: ${feedback['name']}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Feedback: ${feedback['feedback']}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Container(
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
              Container(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Text(
                      "M01 Kolej Tun Dr Ismail",
                      textAlign: TextAlign.center,
                    ),
                    Text("Max Capacity : 100"),
                  ],
                ),
              ),
              Container(
                height: double.infinity,
                child: FirebaseAnimatedList(
                  query: dbref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                    Map feedback = snapshot.value as Map;
                    feedback['key'] = snapshot.key;

                    return ListItem(feedback: feedback);
                  },
                ),
              ),
            ],
          ),
        ),
      ]), 
    );
  }
}
