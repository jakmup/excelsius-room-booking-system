import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              const ProfileSummaryCard(),
              _ProfileDetailCard('Name', 'Aldito Pasha'),
              _ProfileDetailCard('Department', 'Kolej Tun Dr Ismail'),
              _ProfileDetailCard('Staff No', '0035'),
              _ProfileDetailCard('Email', 'aldito@utm.my'),
              _ProfileDetailCard('Contact No.', '012-3456789')
            ]),
      ),
    );
  }
}

/// An example of the elevated card type.
///
/// The default settings for [Card] will provide an elevated
/// card matching the spec:
///
/// https://m3.material.io/components/cards/specs#a012d40d-7a5c-4b07-8740-491dec79d58b
class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Profile Summary')),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _ProfileDetailCard(String label, String data) {
  return Card(
    child: ListTile(
      title: Text(label),
      subtitle: Text(data),
    ),
  );
}
