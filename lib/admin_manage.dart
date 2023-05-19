import 'package:flutter/material.dart';

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

class _LisTileExampleState extends State<LisTileExample>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  // late final Animation<double> _fadeAnimation;
  // late final Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 850),
      vsync: this,
    )..repeat(reverse: true);

    // _fadeAnimation = CurvedAnimation(
    //   parent: _fadeController,
    //   curve: Curves.easeInOut,
    // );

    // _sizeAnimation = CurvedAnimation(
    //   parent: _sizeController,
    //   curve: Curves.easeOut,
    // );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Samples')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
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
          ),
          Hero(
            tag: 'ListTile-Hero',
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the hero transition.
            child: Material(
              child: ListTile(
                title: const Text('Booking Request'),
                subtitle: const Text('Tap here to see Booking Request'),
                tileColor: Colors.cyan,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(title: const Text('ListTile Hero')),
                        body: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("images/UTMbilikSeminar.jpg"),
                                  fit: BoxFit.fill),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                  height: 400,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.orange,
                                  ),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: <Widget>[
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.white,
                                                    onPrimary: Colors.red,
                                                    side: BorderSide(
                                                        width: 3,
                                                        color: Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          scrollable: true,
                                                          title: const Text(
                                                              "Reject Application"),
                                                          content: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Form(
                                                              child: Column(
                                                                children: [
                                                                  ElevatedButton(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        primary:
                                                                            Colors.red,
                                                                        onPrimary:
                                                                            Colors.white,
                                                                      ),
                                                                      onPressed:
                                                                          () {
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
                                                                      icon: Icon(
                                                                          Icons
                                                                              .note_add_outlined),
                                                                    ),
                                                                  ),
                                                                  Text("   "),
                                                                  ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .orange,
                                                                      onPrimary:
                                                                          Colors
                                                                              .white,
                                                                    ),
                                                                    child: const Text(
                                                                        "Submit"),
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
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Column(
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.green,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          scrollable: true,
                                                          title: const Text(
                                                              "Are you sure?"),
                                                          content: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  child: const Text(
                                                                      "Are you sure you want to continue?\n\n"),
                                                                ),
                                                                Container(
                                                                  child: Row(
                                                                    children: <Widget>[
                                                                      ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.white,
                                                                          onPrimary:
                                                                              Colors.red,
                                                                          side: BorderSide(
                                                                              width: 3,
                                                                              color: Colors.red),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: Text(
                                                                            "No"),
                                                                      ),
                                                                      Text(
                                                                          "   "),
                                                                      ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.green,
                                                                          onPrimary:
                                                                              Colors.white,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return AlertDialog(
                                                                                scrollable: true,
                                                                                content: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: Column(
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
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.note,
                  color: Colors.black,
                ),
                label: 'Note',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.wallet,
                  color: Colors.black,
                ),
                label: 'Finance',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_alert,
                  color: Colors.black,
                ),
                label: 'Notification',
              ),
            ],
            // currentIndex: _selectedIndex,
            // selectedItemColor: Colors.amber[800],
            // onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
