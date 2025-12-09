import 'package:flutter/material.dart';
import 'calculator.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darknaki = false;
  void darkhoileDark() {
    setState(() {
      darknaki = !darknaki;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Calculator ',

      debugShowCheckedModeBanner: false,
      theme: darknaki ? ThemeData.dark() : ThemeData.light(),
      home: Calculator(darkhoileDark: darkhoileDark),
    );
  }
}
