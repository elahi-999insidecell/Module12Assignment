import 'package:flutter/material.dart';
import 'wid/button1.dart';

class Calculator extends StatefulWidget {
  final VoidCallback darkhoileDark;
  const Calculator({super.key, required this.darkhoileDark});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = "0";
  String _output = "0";
  String _operator = "";
  double num1 = 0;
  double num2 = 0;

  void pressedButt(String val) {
    setState(() {
      if (val == 'AC') {
        _input = "0";
        _output = "0";
        _operator = "";
        num1 = 0;
        num2 = 0;
      }
      //dekhtesi input e dot ache kina, jodi thake tahole abar dot add korbe na
      //ar jodi na thake tahole input e dot add korbe
      //same input newar moto logic
      else if (val == ".") {
        if (_input.contains(".")) {
          return;
        } else {
          _input += val; //val = "." 20 . 5 emon
          _output = _input;
        }
      }
      //dekhtesi operator kina? hoile operator e set kore dicchi ar
      //number 1 e input ta parse kore dicchi, ar input ta khali kore dicchi
      else if (['+', '-', 'x', '÷'].contains(val)) {
        //operator ache but number nai, mane multiple operator chaapa hoise
        //ejonno oitake print i korbo na.
        if (_operator.isNotEmpty && _input.isEmpty) {
          return;
        }
        _operator = val;
        num1 = double.parse(_input);
        _input = "";
        return;
      }
      //jodi equal chaape,taile num2 te input ta parse kore dicchi
      //jodi operator set thake ar input o thake,taile operation ta korbo
      else if (val == '=') {
        num2 = double.parse(_input);
        if (_operator.isNotEmpty && _input.isNotEmpty) {
          if (_operator == '+') {
            _output = (num1 + num2).toStringAsFixed(2);
          } else if (_operator == '-') {
            _output = (num1 - num2).toStringAsFixed(2);
          } else if (_operator == 'x') {
            _output = (num1 * num2).toStringAsFixed(2);
          } else if (_operator == '÷') {
            if (num2 == 0) {
              _output = "Cannot divide by zero";
            } else {
              _output = (num1 / num2).toStringAsFixed(2);
            }
          }
        }
      } else {
        if (_input == "0") {
          _input = val;
        } else {
          _input += val;
        }
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Calculator'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,

        actions: [
          IconButton(
            onPressed: widget.darkhoileDark,
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "$num1 $_operator $num2",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _output,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button1('7', buttname: '7', onClick: () => pressedButt('7')),
                Button1('8', buttname: '8', onClick: () => pressedButt('8')),
                Button1('9', buttname: '9', onClick: () => pressedButt('9')),
                Button1(
                  'AC',
                  buttname: 'AC',
                  onClick: () => pressedButt('AC'),
                  bgcolor: Colors.pink,
                  fgcolor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button1('4', buttname: '4', onClick: () => pressedButt('4')),
                Button1('5', buttname: '5', onClick: () => pressedButt('5')),
                Button1('6', buttname: '6', onClick: () => pressedButt('6')),
                Button1('-', buttname: '-', onClick: () => pressedButt('-')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button1('1', buttname: '1', onClick: () => pressedButt('1')),
                Button1('2', buttname: '2', onClick: () => pressedButt('2')),
                Button1('3', buttname: '3', onClick: () => pressedButt('3')),
                Button1('+', buttname: '+', onClick: () => pressedButt('+')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button1('0', buttname: '0', onClick: () => pressedButt('0')),
                Button1('÷', buttname: '÷', onClick: () => pressedButt('÷')),
                Button1('x', buttname: 'x', onClick: () => pressedButt('x')),
                Button1('=', buttname: '=', onClick: () => pressedButt('=')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button1(".", buttname: ".", onClick: () => pressedButt('.')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
