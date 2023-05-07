import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _logout() {
    // TODO: Clear any locally stored user session information here.
    // For example, you might use a package like shared_preferences to store and retrieve
    // user data from local storage.

    // Navigate the user to the login screen.
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Excelsius Room Booking System',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _logout,
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Change the button's background color.
                onPrimary: Colors.white, // Change the button's text color.
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
