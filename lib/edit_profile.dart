import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (FirebaseAuth.instance.currentUser != null) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    print(uid);
  }

  runApp(const Profile());
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String uid = FirebaseAuth.instance.currentUser?.uid as String;
  final DatabaseReference database = FirebaseDatabase.instance.ref("User");

  final nameController = TextEditingController(text: 'nama');
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
                title: const Text('Name'),
                subtitle: TextField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              Card(
                  child: ListTile(
                title: const Text('Department'),
                subtitle: TextField(
                  controller: deptController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              Card(
                  child: ListTile(
                title: const Text('Staff No'),
                subtitle: TextField(
                  controller: staffNoController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              Card(
                  child: ListTile(
                title: const Text('Email'),
                subtitle: TextField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              Card(
                  child: ListTile(
                title: const Text('Contact No'),
                subtitle: TextField(
                  controller: contactController,
                  decoration:
                      const InputDecoration(border: UnderlineInputBorder()),
                ),
              )),
              FilledButton(
                  onPressed: () async {
                    try {
                      print(nameController.text);
                      print(deptController.text);
                      print(staffNoController.text);
                      print(emailController.text);
                      print(contactController.text);

                      await database.update({
                        'name': nameController.text,
                        'dept': deptController.text,
                        'staffNo': staffNoController.text,
                        'email': emailController.text,
                        'contact': contactController.text,
                      });
                    } catch (e) {
                      print('You got an error! $e');
                    }
                  },
                  child: const Text("Submit"))
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
