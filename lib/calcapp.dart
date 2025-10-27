import 'package:flutter/material.dart';

class Calcapp extends StatefulWidget {
  const Calcapp({super.key});

  @override
  State<Calcapp> createState() => _CalcappState();
}

class _CalcappState extends State<Calcapp> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  buttonpresses(String buttontext) {
    if (buttontext == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "/" ||
        buttontext == "*") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0 ";
    } else if (buttontext == "=") {
      num2 = double.parse(output);
      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "*":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttontext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Calculator App')),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(output, style: TextStyle(fontSize: 50)),
            ),
            Expanded(child: Divider(color: Colors.black)),

            Column(
              children: [
                Row(
                  children: [
                    //applying the button widget that has been created below
                    buildbutton('7', Colors.black),
                    buildbutton('8', Colors.black),
                    buildbutton('9', Colors.black),
                    buildbutton('/', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildbutton('4', Colors.black),
                    buildbutton('5', Colors.black),
                    buildbutton('6', Colors.black),
                    buildbutton('*', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildbutton('1', Colors.black),
                    buildbutton('2', Colors.black),
                    buildbutton('3', Colors.black),
                    buildbutton('+', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildbutton('.', Colors.black),
                    buildbutton('0', Colors.black),
                    buildbutton('C', Colors.black),
                    buildbutton('-', Colors.orange),
                  ],
                ),
                Row(children: [buildbutton('=', Colors.green)]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //creating a button widget
  Widget buildbutton(String buttonText, Color colorbutton) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: colorbutton,
          ),
          onPressed: () {
            buttonpresses(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
