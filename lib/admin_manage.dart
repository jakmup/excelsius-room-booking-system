import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:room_booking_system/start_apps.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const LisTileExample(),
    );
  }
}

class LisTileExample extends StatefulWidget {
  const LisTileExample({super.key});

  @override
  State<LisTileExample> createState() => _LisTileExampleState();
}

final TextEditingController _searchController = TextEditingController();

class _LisTileExampleState extends State<LisTileExample> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.orange)),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
                image: DecorationImage(
                    image: AssetImage('assets/images/Image1.png'),
                    fit: BoxFit.cover),
              ),
              child: Text('uniroom'),
            ),
            ListTile(
              leading: Icon(
                Icons.people,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: const Text('Log Out'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Start()));
                });
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40),
          searchBar(),
          SizedBox(height: 40),
          listHero(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Container searchBar() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // Add padding around the search bar
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        // Use a Material design search bar
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            // Add a clear button to the search bar
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => _searchController.clear(),
            ),
            // Add a search icon or button to the search bar
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Perform the search here
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }

  Hero listHero() {
    return Hero(
      tag: 'ListTile-Hero',
      // Wrap the ListTile in a Material widget so the ListTile has someplace
      // to draw the animated colors during the hero transition.
      child: Material(
        child: ListTile(
          title: const Text('Booking Request'),
          subtitle: const Text('Tap here to see Booking Request'),
          tileColor: Colors.orange,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Widget>(builder: (BuildContext context) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Bilik Seminar M01",
                                      style: (TextStyle(
                                          color: Colors.white,
                                          shadows: [
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
                                      style: (TextStyle(
                                          color: Colors.white,
                                          shadows: [
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
                          Container(
                            height: 400,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: <Widget>[
                                SizedBox(height: 40),
                                ListTile(
                                  title: Text('Application Details'),
                                  subtitle: Text(
                                      "\n\nFrom : 14 Apr 2023 (Friday), 3.00 PM \nTo : 14 Apr 2023 (Friday), 5.00 PM \nNo of Guests : 50 \nPayment Status : Paid\n\n\n\nRequested by : Faizah Faiqah\nPhone No : 0123456789\nEmail : ffaiqah3@utm.my\nTimestamp : 8 April 2023, 2.00 PM\n\n"),
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
                                              side: BorderSide(
                                                  width: 3, color: Colors.red),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    scrollable: true,
                                                    title: const Text(
                                                        "Reject Application"),
                                                    content: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Form(
                                                        child: Column(
                                                          children: [
                                                            ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary:
                                                                      Colors
                                                                          .red,
                                                                  onPrimary:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    "Back")),
                                                            TextFormField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    "Note to applicant: ",
                                                                icon: Icon(Icons
                                                                    .note_add_outlined),
                                                              ),
                                                            ),
                                                            Text("   "),
                                                            ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                primary: Colors
                                                                    .orange,
                                                                onPrimary:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                              child: const Text(
                                                                  "Submit"),
                                                              onPressed: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      scrollable:
                                                                          true,
                                                                      content:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Card(
                                                                              child: Image(
                                                                                image: AssetImage("images/checkmark.png"),
                                                                                height: 90,
                                                                                width: 90,
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              child: Text("\nYou have rejected the application!\n"),
                                                                            ),
                                                                            ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(
                                                                                primary: Colors.orange,
                                                                                onPrimary: Colors.white,
                                                                              ),
                                                                              child: const Text("Return"),
                                                                              onPressed: () {
                                                                                Navigator.popUntil(context, (route) => route.isFirst);
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Text("Reject"),
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
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    scrollable: true,
                                                    title: const Text(
                                                        "Are you sure?"),
                                                    content: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: const Text(
                                                                "Are you sure you want to continue?\n\n"),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .white,
                                                                    onPrimary:
                                                                        Colors
                                                                            .red,
                                                                    side: BorderSide(
                                                                        width:
                                                                            3,
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      "No"),
                                                                ),
                                                                Text("   "),
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .green,
                                                                    onPrimary:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          scrollable:
                                                                              true,
                                                                          content:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Card(
                                                                                  child: Image(
                                                                                    image: AssetImage("images/checkmark.png"),
                                                                                    height: 90,
                                                                                    width: 90,
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  child: Text("\nYou have approved the application!\n"),
                                                                                ),
                                                                                ElevatedButton(
                                                                                  style: ElevatedButton.styleFrom(
                                                                                    primary: Colors.orange,
                                                                                    onPrimary: Colors.white,
                                                                                  ),
                                                                                  child: const Text("Return"),
                                                                                  onPressed: () {
                                                                                    Navigator.popUntil(context, (route) => route.isFirst);
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                      "Yes"),
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
                                            },
                                            child: Text("Approve"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (values) {
          setState(() {
            _selectedIndex = values;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note, color: Colors.black), label: "Booking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Colors.black), label: "Payment"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert), label: "Notification"),
        ],
        selectedItemColor: Colors.amber[800]);
  }
}
