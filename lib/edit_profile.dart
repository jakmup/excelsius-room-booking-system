import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final nameController = TextEditingController(text: 'Aldito Pasha');
  final deptController = TextEditingController(text: 'Kolej Tun Dr Ismail');
  final staffNoController = TextEditingController(text: '0035');
  final emailController = TextEditingController(text: 'aldito@utm.my');
  final contactController = TextEditingController(text: '012-3456789');
  String name = '', dept = '', staffNo = '', email = '', contact = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xfffcfcfc),
        appBar: AppBar(
          title: const Text("Back"),
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
            shrinkWrap: true,
            padding: const EdgeInsets.all(15.0),
            children: <Widget>[
              _ProfileSummaryCard(),
              Card(
                  child: ListTile(
                title: Text('Name'),
                subtitle: TextField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              Card(
                  child: ListTile(
                title: Text('Department'),
                subtitle: TextField(
                  controller: deptController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              Card(
                  child: ListTile(
                title: Text('Staff No'),
                subtitle: TextField(
                  controller: staffNoController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              Card(
                  child: ListTile(
                title: Text('Email'),
                subtitle: TextField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              Card(
                  child: ListTile(
                title: Text('Contact No'),
                subtitle: TextField(
                  controller: contactController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              FilledButton(
                  onPressed: () {
                    print(nameController.text);
                    print(deptController.text);
                    print(staffNoController.text);
                    print(emailController.text);
                    print(contactController.text);
                  },
                  child: Text("Submit"))
            ]),
      ),
    );
  }
}

Widget _ProfileSummaryCard() {
  return Card(
    child: Row(
      children: [
        Container(height: 100),
        /*1*/
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              'assets/images/profilepic.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ]),
        ),
        /*2*/
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Aldito Pasha',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kolej Tun Dr Ismail',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Manager',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget _ProfileDetailCard(String label, String data) {
  return Card(
      child: ListTile(
    title: Text(label),
    subtitle: TextField(
      controller: TextEditingController(text: data),
      decoration: const InputDecoration(border: OutlineInputBorder()),
    ),
  ));
}
