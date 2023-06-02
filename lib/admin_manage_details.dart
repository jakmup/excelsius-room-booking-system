import 'package:flutter/material.dart';

class AdminManageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bilik Seminar M01",
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            // color of the shadow
                            color: Colors.black,
                            offset: Offset(2, 2),
                          ),
                          // color and font size of the text
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                    Text(
                      "M01, Kolej Tun Dr. Ismail",
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            // color of the shadow
                            color: Colors.black,
                            offset: Offset(2, 2),
                          ),
                          // color and font size of the text
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(height: 40),
                    ListTile(
                      title: Text('Application Details'),
                      subtitle: Text(
                        "\n\nFrom : 14 Apr 2023 (Friday), 3.00 PM \nTo : 14 Apr 2023 (Friday), 5.00 PM \nNo of Guests : 50 \nPayment Status : Paid\n\n\n\nRequested by : Faizah Faiqah\nPhone No : 0123456789\nEmail : ffaiqah3@utm.my\nTimestamp : 8 April 2023, 2.00 PM\n\n",
                      ),
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
                                  side: BorderSide(width: 3, color: Colors.red),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        title: const Text("Reject Application"),
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Form(
                                            child: Column(
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.red,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Back"),
                                                ),
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
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.orange,
                                                    onPrimary: Colors.white,
                                                  ),
                                                  child: const Text("Submit"),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          scrollable: true,
                                                          content: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Column(
                                                              children: [
                                                                Card(
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        "images/checkmark.png"),
                                                                    height: 90,
                                                                    width: 90,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                      "\nYou have rejected the application!\n"),
                                                                ),
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .orange,
                                                                    onPrimary:
                                                                        Colors
                                                                            .white,
                                                                  ),
                                                                  child: const Text(
                                                                      "Return"),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.popUntil(
                                                                        context,
                                                                        (route) =>
                                                                            route.isFirst);
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
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        title: const Text("Are you sure?"),
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: const Text(
                                                    "Approve the request?\n\n"),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.white,
                                                        onPrimary: Colors.red,
                                                        side: BorderSide(
                                                            width: 3,
                                                            color: Colors.red),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("No"),
                                                    ),
                                                    Text("   "),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
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
                                                              content: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Column(
                                                                  children: [
                                                                    Card(
                                                                      child:
                                                                          Image(
                                                                        image: AssetImage(
                                                                            "images/checkmark.png"),
                                                                        height:
                                                                            90,
                                                                        width:
                                                                            90,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child: Text(
                                                                          "\nYou have approved the application!\n"),
                                                                    ),
                                                                    ElevatedButton(
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        primary:
                                                                            Colors.orange,
                                                                        onPrimary:
                                                                            Colors.white,
                                                                      ),
                                                                      child: const Text(
                                                                          "Return"),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.popUntil(
                                                                            context,
                                                                            (route) =>
                                                                                route.isFirst);
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Text("Yes"),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
