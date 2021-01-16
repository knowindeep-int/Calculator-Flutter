import 'package:Calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _previous = '';
  String _now = '';

  void numClick(String text) {
    setState(() => _now += text);
  }

  void allClear(String text) {
    setState(() {
      _previous = '';
      _now = '';
    });
  }

  void clear(String text) {
    setState(() {
      _now = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_now);
    ContextModel cm = ContextModel();

    setState(() {
      _previous = _now;
      _now = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(164, 135, 231, 1),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  _previous,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF545F61),
                    ),
                  ),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _now,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                  text: 'AC',
                  fillColor: Color.fromRGBO(203, 58, 33, 1),
                  textColor: Colors.white,
                  callback: allClear,
                ),
                Button(
                  text: 'C',
                  fillColor: Color.fromRGBO(203, 58, 33, 1),
                  textColor: Colors.white,
                  callback: clear,
                ),
                Button(
                  text: '%',
                  fillColor:  Color.fromRGBO(220, 209, 240, 1),
                  textColor: Colors.black,
                  callback: numClick,
                ),
                Button(
                  text: '/',
                  fillColor:  Color.fromRGBO(220, 209, 240, 1),
                  textColor: Colors.black,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                  text: '7',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '8',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '9',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '*',
                  fillColor:  Color.fromRGBO(220, 209, 240, 1),
                  textColor: Colors.black,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                  text: '4',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '5',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '6',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '-',
                  fillColor:  Color.fromRGBO(220, 209, 240, 1),
                  textColor: Colors.black,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                  text: '1',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '2',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '3',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '+',
                  fillColor:  Color.fromRGBO(220, 209, 240, 1),
                  textColor: Colors.black,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(
                  text: '.',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '0',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '00',
                  textColor: Colors.white,
                  callback: numClick,
                ),
                Button(
                  text: '=',
                  fillColor:  Color.fromRGBO(220, 209, 240, 1),
                  textColor: Colors.black,
                  callback: evaluate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
