import 'package:flutter/material.dart';

class Calcapp extends StatefulWidget {
  const Calcapp({super.key});

  @override
  State<Calcapp> createState() => _CalcappState();
}

class _CalcappState extends State<Calcapp> {
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
              child: Text("0", style: TextStyle(fontSize: 50)),
            ),
            Expanded(child: Divider(color: Colors.black)),

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
        margin: EdgeInsets.all(5),

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: colorbutton,
          ),
          onPressed: () {},
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
