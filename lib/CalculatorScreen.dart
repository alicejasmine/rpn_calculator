import 'package:flutter/material.dart';

import 'operations.dart';
import 'rpn_calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final RPNCalculator calculator = RPNCalculator();

  num input = 0;

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
                    calculator.stack.isEmpty ? "0" : '${calculator.stack.last}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add spacing between the two values
                  Text(
                    '$input',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => onClearButtonPress(),
                    child: const Text('AC'),
                  ),
                  ElevatedButton(
                    onPressed: () => onOperationButtonPress('%'),
                    child: const Text('%'),
                  ),
                  ElevatedButton(
                    onPressed: () => onOperationButtonPress('^'),
                    child: const Text('^'),
                  ),
                  ElevatedButton(
                    onPressed: () => onOperationButtonPress('÷'),
                    child: const Text('÷'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () => onNumericButtonPress(7),
                    child: const Text('7'),
                  ),
                  FilledButton(
                    onPressed: () => onNumericButtonPress(8),
                    child: const Text('8'),
                  ),
                  FilledButton(
                    onPressed: () => onNumericButtonPress(9),
                    child: const Text('9'),
                  ),
                  ElevatedButton(
                    onPressed: () => onOperationButtonPress('x'),
                    child: const Text('x'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () => onNumericButtonPress(4),
                    child: const Text('4'),
                  ),
                  FilledButton(
                    onPressed: () => onNumericButtonPress(5),
                    child: const Text('5'),
                  ),
                  FilledButton(
                    onPressed: () => onNumericButtonPress(6),
                    child: const Text('6'),
                  ),
                  ElevatedButton(
                    onPressed: () => onOperationButtonPress('-'),
                    child: const Text('-'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () => onNumericButtonPress(1),
                    child: const Text('1'),
                  ),
                  FilledButton(
                    onPressed: () => onNumericButtonPress(2),
                    child: const Text('2'),
                  ),
                  FilledButton(
                    onPressed: () => onNumericButtonPress(3),
                    child: const Text('3'),
                  ),
                  ElevatedButton(
                    onPressed: () => onOperationButtonPress('+'),
                    child: const Text('+'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(onPressed: () {}, child: const Text('0')),
                  FilledButton(onPressed: () {}, child: const Text(',')),
                  ElevatedButton(
                      onPressed: () => onEnterButtonPress(),
                      child: const Text('ENTER')),
                ],
              ),
            ])));
  }

  void onNumericButtonPress(num value) {
    setState(() {
      if (input == 0) {
        input = value;
      } else {
        input = input * 10 + value;
      }
    });
  }

  void onEnterButtonPress() {
    setState(() {
      calculator.addToList(input.toDouble());
      input = 0;
    });
  }

  void onOperationButtonPress(String value) {
    setState(() {
      calculator.addToList(input.toDouble());

      switch (value) {
        case '+':
          calculator.executeOperation(AddOperation());
        case '-':
          calculator.executeOperation(SubtractOperation());
        case 'x':
          calculator.executeOperation(MultiplyOperation());
        case '÷':
          calculator.executeOperation(DivideOperation());
        case '^':
          calculator.executeOperation(ExponentialOperation());
        case '%':
          calculator.executeOperation(RestOperation());
        default:
          print("Invalid operation");
      }
    });
    input = 0;
  }

  void onClearButtonPress() {
    setState(() {
      calculator.clearStack();
      input = 0;
    });
  }
}
