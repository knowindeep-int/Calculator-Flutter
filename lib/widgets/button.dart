import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final Function callback;

  const Button({
    this.text,
    this.fillColor,
    this.textColor,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 65,
      height: 65,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: () {
          callback(text);
        },
        child: Text(
          text,
          style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        color: fillColor==null ? null : fillColor,
        textColor: textColor,
      ),
    );
  }
}