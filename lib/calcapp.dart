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
  String expression = "";

  // Formating number, showing int if no decimal, otherwise it shows double
  String formatNumber(double number) {
    return number == number.toInt()
        ? number.toInt().toString()
        : number.toString();
  }

  void buttonpresses(String buttontext) {
    if (buttontext == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
      expression = "";
    } else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "/" ||
        buttontext == "*") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0";

      expression = "${formatNumber(num1)} $operand";
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

      expression =
          "${formatNumber(num1)} $operand ${formatNumber(num2)} = ${formatNumber(double.parse(_output))}";

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      if (_output == "0") {
        _output = buttontext;
      } else {
        _output += buttontext;
      }

      if (operand.isEmpty) {
        expression = _output;
      } else {
        expression = "${formatNumber(num1)} $operand $_output";
      }
    }

    setState(() {
      output = double.parse(
        _output,
      ).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculator App',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Text(
                expression,
                style: const TextStyle(fontSize: 24, color: Colors.grey),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(output, style: const TextStyle(fontSize: 30)),
            ),

            const Divider(color: Colors.black),

            Column(
              children: [
                Row(
                  children: [
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

  Widget buildbutton(String buttonText, Color colorbutton) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
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
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
