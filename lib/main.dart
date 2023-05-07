import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const AppsWidget(),
      ),
    );
  }
}

class AppsWidget extends StatefulWidget {
  const AppsWidget({Key? key}) : super(key: key);
  @override
  _AppsWidgetState createState() => _AppsWidgetState();
}

class _AppsWidgetState extends State<AppsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 414,
                  height: 1075,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Image1.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 414, height: 896, decoration: BoxDecoration())),
          Positioned(
              top: 140,
              left: 118,
              child: Text(
                'uniroom',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 153, 0, 1),
                    fontFamily: 'Ubuntu',
                    fontSize: 45,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 202,
              left: 67,
              child: Text(
                'Book a space with no fuss',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 153, 0, 1),
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 307,
              left: 117,
              child: Container(
                  width: 179,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: Color.fromRGBO(255, 153, 0, 1),
                  ))),
          Positioned(
              top: 367,
              left: 117,
              child: Container(
                  width: 179,
                  height: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: Color.fromRGBO(255, 153, 0, 1),
                  ))),
          Positioned(
              top: 320,
              left: 176,
              child: Text(
                'Log in',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 380,
              left: 172,
              child: Text(
                'SIGN in',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Ubuntu',
                    fontSize: 15,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 476,
              left: 228,
              child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 12.600000381469727,
                        left: 6.300000190734863,
                        child: SvgPicture.asset('assets/images/vector.svg',
                            semanticsLabel: 'vector')),
                  ]))),
        ]));
  }
}
