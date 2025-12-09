import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button1 extends StatelessWidget {
  String buttname;
  Color? bgcolor;
  Color? fgcolor;
  final VoidCallback? onClick;

  Button1(
    String s, {
    super.key,
    required this.buttname,
    required this.onClick,
    this.bgcolor,
    this.fgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor ?? Colors.white60,
          foregroundColor: fgcolor ?? Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onClick,
        child: Text(buttname),
      ),
    );
  }
}
