import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  String result = "0";
  String input = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("RPN Calculator"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: TextStyle(fontSize: 30,  fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // Display Result
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    input,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('AC'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('+/-'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('%'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('/'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: const Text('7'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('8'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('9'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('X'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: const Text('4'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('5'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('6'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('-'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {},
                    child: const Text('1'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('2'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('3'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('+'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(onPressed: () {}, child: const Text('0')),
                  FilledButton(onPressed: () {}, child: const Text(',')),
                  ElevatedButton(onPressed: () {}, child: const Text('ENTER')),
                ],
              ),
            ])));
  }
}
